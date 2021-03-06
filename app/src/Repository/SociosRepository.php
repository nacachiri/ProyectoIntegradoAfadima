<?php

namespace App\Repository;

use App\Entity\{Socios, Numerarios};
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @method Socios|null find($id, $lockMode = null, $lockVersion = null)
 * @method Socios|null findOneBy(array $criteria, array $orderBy = null)
 * @method Socios[]    findAll()
 * @method Socios[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SociosRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager, UserPasswordHasherInterface $encoder, ValidatorInterface $validator)
    {
        parent::__construct($registry, Socios::class);
        $this->manager = $entityManager;
        $this->encoder = $encoder;
        $this->validator = $validator;
    }

    public function showAll()
    {
        $socios = $this->findAll();

        if ($socios == null) {
            throw new NotFoundHttpException('No hay Socios');
        }

        foreach ($socios as $socio) {

            $data[] = [

                'socioId' => $socio->getId(),
                'email' => $socio->getEmail(),
                'password' => $socio->getPassword(),
                'rol' => $socio->getRoles(),
                'name' => $socio->getName(),
                'surnames' => $socio->getSurnames(),
                'address' => $socio->getAddress(),
                'phone' => $socio->getPhone(),
                'numerarioId' => $socio->getNumerarioId()?->getName()

            ];

        }

        return $data;
    }

    public function showId($id)
    {
        $socio = $this->findOneBy(['id' => $id]);

        if ($socio == null) {
            throw new NotFoundHttpException('No hay Socio');
        }

        $data = [

            'socioId' => $socio->getId(),
            'email' => $socio->getEmail(),
            'password' => $socio->getPassword(),
            'rol' => $socio->getRoles(),
            'name' => $socio->getName(),
            'surnames' => $socio->getSurnames(),
            'address' => $socio->getAddress(),
            'phone' => $socio->getPhone(),
            'numerarioId' => $socio->getNumerarioId()?->getName()

        ];

        return $data;
    }

    public function add($email, $password, $rol, $name, $surnames, $address, $phone, $numerarioId)
    {
        $socio = new Socios();

        $encoded = $this->encoder->hashPassword($socio, $password);

        $socio
            ->setEmail($email)
            ->setPassword($encoded)
            ->setRol($rol)
            ->setName($name)
            ->setSurnames($surnames)
            ->setAddress($address)
            ->setPhone($phone)
            ->setNumerarioId($this->manager->getRepository(Numerarios::class)->findOneBy(['id' => $numerarioId]));


        $errors = $this->validator->validate($socio);

        if (count($errors) > 0) {
            
            foreach ($errors as $value) {
                $arrError[] = $value->getMessage();
            }

            return ['error' => 1, 'message' => $arrError];;

        }else {
            
            $this->manager->persist($socio);
            $this->manager->flush();

            return ['error' => 0, 'message' => 'Socio Creado correctamente'];
        }
        
    }

    public function edit(Socios $socio, $email, $password, $rol, $name, $surnames, $address, $phone, $numerarioId): Socios
    {

        empty($email) ? true : $socio->setEmail($email);
        empty($password) ? true : $socio->setPassword($this->encoder->hashPassword($socio, $password));
        empty($rol) ? true : $socio->setRol($rol);
        empty($name) ? true : $socio->setName($name);
        empty($surnames) ? true : $socio->setSurnames($surnames);
        empty($address) ? true : $socio->setAddress($address);
        empty($phone) ? true : $socio->setPhone($phone);
        empty($numerarioId) ? true : $socio->setNumerarioId($this->manager->getRepository(Numerarios::class)->findOneBy(['id' => $numerarioId]));

        $this->manager->persist($socio);
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
