<?php

namespace App\Repository;

use App\Entity\{Socios, Numerarios};
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
                'password' => $socio->getPassword(),
                'rol' => $socio->getRol(),
                'name' => $socio->getName(),
                'surnames' => $socio->getSurnames(),
                'address' => $socio->getAddress(),
                'phone' => $socio->getPhone(),
                'numerarioId' => $socio->getNumerarioId()?->getName()

            ];

        }

        return $data;
    }

    public function add($email, $password, $rol, $name, $surnames, $address, $phone, $numerarioId)
    {
        $socio = new Socios();

        $socio
            ->setEmail($email)
            ->setPassword($password)
            ->setRol($rol)
            ->setName($name)
            ->setSurnames($surnames)
            ->setAddress($address)
            ->setPhone($phone)
            ->setNumerarioId($this->manager->getRepository(Numerarios::class)->findOneBy(['id' => $numerarioId]));

        $this->manager->persist($socio);
        $this->manager->flush();
        
    }

    public function edit(Socios $socio, $email, $password, $rol, $name, $surnames, $address, $phone, $numerarioId): Socios
    {

        empty($email) ? true : $socio->setEmail($email);
        empty($password) ? true : $socio->setPassword($password);
        empty($rol) ? true : $socio->setRol($rol);
        empty($name) ? true : $socio->setName($name);
        empty($surnames) ? true : $socio->setSurnames($surnames);
        empty($address) ? true : $socio->setAddress($address);
        empty($phone) ? true : $socio->setPhone($phone);
        empty($numerarioId) ? true : $socio->setNumerarioId($this->manager->getRepository(Numerarios::class)->findOneBy(['id' => $numerarioId]));

        $this->manager->persist($cliente);
        $this->manager->flush();

        return $socio;
    }

    public function delete(Socios $socio)
    {
        $this->manager->remove($socio);
        $this->manager->flush();
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
