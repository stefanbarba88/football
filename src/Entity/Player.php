<?php

namespace App\Entity;

use App\Repository\PlayerRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=PlayerRepository::class)
 */
class Player
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $email;

    /**
     * @ORM\ManyToOne(targetEntity=Team::class, inversedBy="player_id")
     * @ORM\JoinColumn(nullable=false)
     */
    private $team;

    /**
     * @ORM\ManyToMany(targetEntity=Season::class, inversedBy="players")
     */
    private $season;

    /**
     * @ORM\Column(type="object")
     */
    private $teamObject;

    public function __construct()
    {
        $this->season = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getTeam(): ?Team
    {
        return $this->team;
    }

    public function setTeam(?Team $team): self
    {
        $this->team = $team;

        return $this;
    }

    /**
     * @return Collection|Season[]
     */
    public function getSeason(): Collection
    {
        return $this->season;
    }

    public function addSeason(Season $season): self
    {
        if (!$this->season->contains($season)) {
            $this->season[] = $season;
        }

        return $this;
    }

    public function removeSeason(Season $season): self
    {
        $this->season->removeElement($season);

        return $this;
    }

    public function getTeamObject()
    {
        return $this->teamObject;
    }

    public function setTeamObject($teamObject): self
    {
        $this->teamObject = $teamObject;

        return $this;
    }
}
