<?php

namespace App\Repository;

use App\Entity\{Productos, Numerarios};
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @method Productos|null find($id, $lockMode = null, $lockVersion = null)
 * @method Productos|null findOneBy(array $criteria, array $orderBy = null)
 * @method Productos[]    findAll()
 * @method Productos[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductosRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, Productos::class);
        $this->manager = $entityManager;
    }

    public function showAll()
    {
        $productos = $this->findAll();

        if ($productos == null) {
            throw new NotFoundHttpException('No hay Productos');
        }

        foreach ($productos as $producto) {

            $data[] = [

                'id' => $producto->getId(),
                'name' => $producto->getName(),
                'description' => $producto->getDescription(),
                'imgUrl' => 'Imagenes/productos/'.$producto->getImgUrl(),
                'numerarioId' => [
                    'id' => $producto->getNumerarioId()->getId(),
                    'name' => $producto->getNumerarioId()->getName(),
                ]
            ];
        }

        return $data;
    }

    public function showId($id)
    {
        $producto = $this->findOneBy(['id' => $id]);

        if ($producto == null) {
            throw new NotFoundHttpException('No hay Producto');
        }

        $data = [

            'id' => $producto->getId(),
            'name' => $producto->getName(),
            'description' => $producto->getDescription(),
            'imgUrl' => 'Imagenes/productos/'.$producto->getImgUrl(),
            'numerarioId' => $producto->getNumerarioId()->getName(),

        ];

        return $data;
    }

    public function add($name, $description, $imgUrl, $numerarioId)
    {
        $producto = new Productos();

        $producto
            ->setName($name)
            ->setDescription($description)
            ->setImgUrl($imgUrl)
            ->setNumerarioId($this->manager->getRepository(Numerarios::class)->findOneBy(['id' => $numerarioId]));

        $this->manager->persist($producto);
        $this->manager->flush();

    }

    public function edit(Productos $producto, $imagen, $name, $description, $numerarioId): Productos
    {
        empty($name) ? true : $producto->setName($name);
        empty($description) ? true : $producto->setDescription($description);
        empty($socioId) ? true : $producto->setNumerarioId($this->manager->getRepository(Numerarios::class)->findOneBy(['id' => $numerarioId]));
        empty($imagen) ? true : move_uploaded_file($imagen->getRealPath(), 'Imagenes/productos/'.$producto->getImgUrl());

        $this->manager->persist($producto);
        $this->manager->flush();

        return $producto;
    }

    public function delete($productoId)
    {
        $producto = $this->findOneBy(['id' => $productoId]);

        if ($producto == null) {
            throw new NotFoundHttpException('Producto no encotrado');
        }
        
        unlink('Imagenes/productos/'.$producto->getImgUrl());
        $this->manager->remove($producto);
        $this->manager->flush();
    }

    // /**
    //  * @return Productos[] Returns an array of Productos objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Productos
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
