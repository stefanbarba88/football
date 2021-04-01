<?php

namespace App\Controller;
use App\Entity\Player;
use App\Entity\Season;
use App\Entity\Team;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
class SeasonController extends AbstractController
{
    #[Route('/season', name: 'season')]
    public function index(): Response
    {
        $seasons= $this->getDoctrine()->getRepository(Season::class)->findAll();

        return $this->render('season/index.html.twig', ['seasons' => $seasons]);
    }

    #[Route('/season-create', name: 'season-create')]
    public function create(Request $request){

    
        $season1=$request->request->get('season');

        $entityManager= $this->getDoctrine()->getManager();

        $season = new Season;
        $season-> setTitle($season1);
        $entityManager-> persist($season);
        $entityManager-> flush();
         
        $this->addFlash(
            'notice',
            'The season is created!'
        );

        return $this->redirectToRoute('season');
    }
}
