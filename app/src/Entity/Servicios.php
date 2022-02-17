<?php

namespace App\Entity;

use App\Repository\ServiciosRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ServiciosRepository::class)]
class Servicios
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 255)]
    private $name;

    #[ORM\Column(type: 'text')]
    private $description;

    #[ORM\Column(type: 'string', length: 255)]
    private $imgUrl;

    #[ORM\ManyToOne(targetEntity: Socios::class, inversedBy: 'servicios')]
    #[ORM\JoinColumn(name:'socioId', referencedColumnName:'id', nullable: false)]
    private $socioId;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getImgUrl(): ?string
    {
        return $this->imgUrl;
    }

    public function setImgUrl(string $imgUrl): self
    {
        $this->imgUrl = $imgUrl;

        return $this;
    }

    public function getSocioId(): ?socios
    {
        return $this->socioId;
    }

    public function setSocioId(?socios $socioId): self
    {
        $this->socioId = $socioId;

        return $this;
    }
}
