<?php

namespace App\Repository;

use App\Entity\Numerarios;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Numerarios|null find($id, $lockMode = null, $lockVersion = null)
 * @method Numerarios|null findOneBy(array $criteria, array $orderBy = null)
 * @method Numerarios[]    findAll()
 * @method Numerarios[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class NumerariosRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, Numerarios::class);
        $this->manager = $entityManager;
    }

    public function showAll()
    {
        $numerarios = $this->findAll();

        foreach ($numerarios as $numerario) {

            $data[] = [


            ];

        }

        return $data;
    }

    // /**
    //  * @return Numerarios[] Returns an array of Numerarios objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('n')
            ->andWhere('n.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('n.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Numerarios
    {
        return $this->createQueryBuilder('n')
            ->andWhere('n.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
