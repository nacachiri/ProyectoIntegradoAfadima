<?php

namespace App\Repository;

use App\Entity\TipoDiscapacidad;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;

/**
 * @method TipoDiscapacidad|null find($id, $lockMode = null, $lockVersion = null)
 * @method TipoDiscapacidad|null findOneBy(array $criteria, array $orderBy = null)
 * @method TipoDiscapacidad[]    findAll()
 * @method TipoDiscapacidad[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TipoDiscapacidadRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, TipoDiscapacidad::class);
        $this->manager = $entityManager;
    }

    public function showAll()
    {
        $tipoDiscapacidades = $this->findAll();

        if ($tipoDiscapacidades == null) {
            throw new NotFoundHttpException('No hay TipoDiscapacidades');
        }

        foreach ($tipoDiscapacidades as $tipoDiscapacidad) {

            $data[] = [

                'typeId' => $tipoDiscapacidad->getTypeId(),
                'name' => $tipoDiscapacidad->getName(),

            ];

        }

        return $data;
    }

    public function showId($id)
    {
        $tipoDiscapacidad = $this->findOneBy(['typeId' => $id]);

        if ($tipoDiscapacidad == null) {
            throw new NotFoundHttpException('No hay TipoDiscapacidad');
        }

        $data = [

            'typeId' => $tipoDiscapacidad->getTypeId(),
            'name' => $tipoDiscapacidad->getName(),

        ];

        return $data;
    }

    public function add($name)
    {
        $tipoDiscapacidad = new TipoDiscapacidad();

        $tipoDiscapacidad
            ->setName($name);

        $this->manager->persist($tipoDiscapacidad);
        $this->manager->flush();
    }

    public function edit(TipoDiscapacidad $tipoDiscapacidad, $name): TipoDiscapacidad
    {
        empty($name) ? true : $tipoDiscapacidad->setName($name);
       
        $this->manager->persist($tipoDiscapacidad);
        $this->manager->flush();

        return $tipoDiscapacidad;
    }

    public function delete(TipoDiscapacidad $tipoDiscapacidad)
    {
        $this->manager->remove($tipoDiscapacidad);
        $this->manager->flush();
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
