<?php

namespace App\Controller;

use App\Entity\Player;
use App\Entity\Season;
use App\Entity\Team;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

class PlayerController extends AbstractController
{
    #[Route('/player', name: 'player')]
    public function index(): Response
    {
        $teams= $this->getDoctrine()->getRepository(Team::class)->findAll();
        $seasons= $this->getDoctrine()->getRepository(Season::class)->findAll();
        $players= $this->getDoctrine()->getRepository(Player::class)->findAll();

        return $this->render('player/index.html.twig', ['players' => $players, 'seasons'=>$seasons, 'teams'=>$teams]);
    }


    #[Route('/player-create', name: 'player-create')]
    public function create(Request $request){

        $email=$request->request->get('email');
        $team=$request->request->get('team');
        $season=$request->request->get('season');

        
        
        $tim = $this->getDoctrine()->getRepository(Team::class)->find($team);
        $ses = $this->getDoctrine()->getRepository(Season::class)->find($season);
    
       
        $player = new Player();

        $player->setTeamObject($tim);
        $player->setEmail($email);
        $player->addSeason($ses);
        $player->setTeam($tim);

       

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($player);
        $entityManager->flush();

        $this->addFlash(
            'notice',
            'The player is created!'
        );
        

        return $this->redirectToRoute('player');
    }

    
}
