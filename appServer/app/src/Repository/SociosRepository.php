<?php

namespace App\Repository;

use App\Entity\Socios;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Socios|null find($id, $lockMode = null, $lockVersion = null)
 * @method Socios|null findOneBy(array $criteria, array $orderBy = null)
 * @method Socios[]    findAll()
 * @method Socios[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SociosRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, Socios::class);
        $this->manager = $entityManager;
    }

    public function showAll()
    {
        $socios = $this->findAll();

        foreach ($socios as $socio) {

            $data[] = [

                'socioId' => $socio->getId(),
                'email' => $socio->getEmail(),
                'name' => $socio->getName(),
    
            ];

        }

        return $data;
    }

    // /**
    //  * @return Socios[] Returns an array of Socios objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('s.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Socios
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
