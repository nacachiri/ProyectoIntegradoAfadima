<?php

namespace App\Repository;

use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\{Numerarios, Socios, TipoDiscapacidad};
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

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

        if ($numerarios == null) {
            throw new NotFoundHttpException('No hay Numerarios');
        }

        foreach ($numerarios as $numerario) {

            $data[] = [

                'numerarioId' => $numerario->getId(),
                'name' => $numerario->getName(),
                'dni' => $numerario->getDni(),
                'birthDate' => $numerario->getBirthDate()->format('Y-m-d'),
                'typeDisc' => $numerario->getTypeDisc()->getName(),

            ];

        }

        return $data;
    }

    public function showId($id)
    {
        $numerario = $this->findOneBy(['id' => $id]);

        if ($numerario == null) {
            throw new NotFoundHttpException('No hay Numerario');
        }

        $data = [

            'numerarioId' => $numerario->getId(),
            'name' => $numerario->getName(),
            'dni' => $numerario->getDni(),
            'birthDate' => $numerario->getBirthDate()->format('Y-m-d'),
            'typeDisc' => $numerario->getTypeDisc()->getName(),

        ];

        return $data;
    }

    public function add($socioId, $name, $dni, $birthDate, $typeDisc)
    {
        $numerario = new Numerarios();

        $numerario
            ->setName($name)
            ->setDni($dni)
            ->setBirthDate(new DateTime($birthDate))
            ->setTypeDisc($this->manager->getRepository(TipoDiscapacidad::class)->findOneBy(['typeId' => $typeDisc]));

        $this->manager->persist($numerario);
        $this->manager->flush();

        $socio = $this->manager->getRepository(Socios::class)->findOneBy(['id' => $socioId]);
        $socio->setNumerarioId($numerario);

        $this->manager->persist($socio);
        $this->manager->flush();
    }

    public function edit(Numerarios $numerario, $name, $dni, $birthDate, $typeDisc): Numerarios
    {

        empty($name) ? true : $numerario->setName($name);
        empty($dni) ? true : $numerario->setDni($dni);
        empty($birthDate) ? true : $numerario->setBirthDate(new DateTime($birthDate));
        empty($typeDisc) ? true : $numerario->setTypeDisc($this->manager->getRepository(TipoDiscapacidad::class)->findOneBy(['typeId' => $typeDisc]));

        $this->manager->persist($numerario);
        $this->manager->flush();

        return $numerario;
    }

    public function delete(Numerarios $numerario)
    {
        $this->manager->remove($numerario);
        $this->manager->flush();
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
