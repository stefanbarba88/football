<?php

namespace App\Controller;
use App\Entity\Player;
use App\Entity\Season;
use App\Entity\Team;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
class TeamController extends AbstractController
{
    #[Route('/team', name: 'team')]
    public function index(): Response
    {
        $teams= $this->getDoctrine()->getRepository(Team::class)->findAll();

        return $this->render('team/index.html.twig', ['teams' => $teams]);
    }

    #[Route('/team-create', name: 'team-create')]
    public function create(Request $request){

    
        $team1=$request->request->get('team');

        $entityManager= $this->getDoctrine()->getManager();

        $team = new Team;
        $team-> setTitle($team1);
        
        

        $entityManager-> persist($team);
        $entityManager-> flush();

        $this->addFlash(
            'notice',
            'The team is created!'
        );

        return $this->redirectToRoute('team');
    }
}
