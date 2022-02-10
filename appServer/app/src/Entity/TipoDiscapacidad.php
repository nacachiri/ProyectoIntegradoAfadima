<?php

namespace App\Entity;

use App\Repository\TipoDiscapacidadRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TipoDiscapacidadRepository::class)]
class TipoDiscapacidad
{

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer', name: 'typeId')]
    private $typeId;

    #[ORM\Column(type: 'string', length: 255)]
    private $name;

    #[ORM\OneToMany(mappedBy: 'typeDisc', targetEntity: Numerarios::class)]
    private $numerarios;

    public function __construct()
    {
        $this->numerarios = new ArrayCollection();
    }

    public function getTypeId(): ?int
    {
        return $this->typeId;
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

    /**
     * @return Collection|Numerarios[]
     */
    public function getNumerarios(): Collection
    {
        return $this->numerarios;
    }

    public function addNumerario(Numerarios $numerario): self
    {
        if (!$this->numerarios->contains($numerario)) {
            $this->numerarios[] = $numerario;
            $numerario->setTypeDisc($this);
        }

        return $this;
    }

    public function removeNumerario(Numerarios $numerario): self
    {
        if ($this->numerarios->removeElement($numerario)) {
            // set the owning side to null (unless already changed)
            if ($numerario->getTypeDisc() === $this) {
                $numerario->setTypeDisc(null);
            }
        }

        return $this;
    }
}
