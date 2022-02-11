<?php

namespace App\Entity;

use App\Repository\NumerariosRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: NumerariosRepository::class)]
class Numerarios
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 100)]
    private $name;

    #[ORM\Column(type: 'string', length: 10)]
    private $dni;

    #[ORM\Column(type: 'date', name: 'birthDate')]
    private $birthDate;

    #[ORM\ManyToOne(targetEntity: TipoDiscapacidad::class, inversedBy: 'numerarios')]
    #[ORM\JoinColumn(name:'typeDisc', referencedColumnName:'typeId', nullable: false)]
    private $typeDisc;

    #[ORM\OneToMany(mappedBy: 'numerarioId', targetEntity: Productos::class)]
    #[ORM\JoinColumn(name:'productos', referencedColumnName:'productos', nullable: false)]
    private $productos;

    public function __construct()
    {
        $this->productos = new ArrayCollection();
    }

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

    public function getDni(): ?string
    {
        return $this->dni;
    }

    public function setDni(string $dni): self
    {
        $this->dni = $dni;

        return $this;
    }

    public function getBirthDate(): ?\DateTimeInterface
    {
        return $this->birthDate;
    }

    public function setBirthDate(\DateTimeInterface $birthDate): self
    {
        $this->birthDate = $birthDate;

        return $this;
    }

    public function getTypeDisc(): ?TipoDiscapacidad
    {
        return $this->typeDisc;
    }

    public function setTypeDisc(?TipoDiscapacidad $typeDisc): self
    {
        $this->typeDisc = $typeDisc;

        return $this;
    }

    /**
     * @return Collection|Productos[]
     */
    public function getProductos(): Collection
    {
        return $this->productos;
    }

    public function addProducto(Productos $producto): self
    {
        if (!$this->productos->contains($producto)) {
            $this->productos[] = $producto;
            $producto->setNumerarioId($this);
        }

        return $this;
    }

    public function removeProducto(Productos $producto): self
    {
        if ($this->productos->removeElement($producto)) {
            // set the owning side to null (unless already changed)
            if ($producto->getNumerarioId() === $this) {
                $producto->setNumerarioId(null);
            }
        }

        return $this;
    }
}
