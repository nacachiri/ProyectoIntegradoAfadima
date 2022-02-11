<?php

namespace App\Repository;

use App\Entity\TipoDiscapacidad;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TipoDiscapacidad|null find($id, $lockMode = null, $lockVersion = null)
 * @method TipoDiscapacidad|null findOneBy(array $criteria, array $orderBy = null)
 * @method TipoDiscapacidad[]    findAll()
 * @method TipoDiscapacidad[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TipoDiscapacidadRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TipoDiscapacidad::class);
    }

    // /**
    //  * @return TipoDiscapacidad[] Returns an array of TipoDiscapacidad objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('t.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?TipoDiscapacidad
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
