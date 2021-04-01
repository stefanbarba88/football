<?php

namespace App\Entity;

use App\Repository\TeamRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=TeamRepository::class)
 */
class Team
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
    private $title;

    /**
     * @ORM\OneToMany(targetEntity=Player::class, mappedBy="team")
     */
    private $player_id;

    public function __construct()
    {
        $this->player_id = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    /**
     * @return Collection|Player[]
     */
    public function getPlayerId(): Collection
    {
        return $this->player_id;
    }

    public function addPlayerId(Player $playerId): self
    {
        if (!$this->player_id->contains($playerId)) {
            $this->player_id[] = $playerId;
            $playerId->setTeam($this);
        }

        return $this;
    }

    public function removePlayerId(Player $playerId): self
    {
        if ($this->player_id->removeElement($playerId)) {
            // set the owning side to null (unless already changed)
            if ($playerId->getTeam() === $this) {
                $playerId->setTeam(null);
            }
        }

        return $this;
    }
}
