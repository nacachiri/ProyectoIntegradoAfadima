<?php

namespace Container3blqXG0;
include_once \dirname(__DIR__, 4).''.\DIRECTORY_SEPARATOR.'vendor'.\DIRECTORY_SEPARATOR.'doctrine'.\DIRECTORY_SEPARATOR.'persistence'.\DIRECTORY_SEPARATOR.'lib'.\DIRECTORY_SEPARATOR.'Doctrine'.\DIRECTORY_SEPARATOR.'Persistence'.\DIRECTORY_SEPARATOR.'ObjectManager.php';
include_once \dirname(__DIR__, 4).''.\DIRECTORY_SEPARATOR.'vendor'.\DIRECTORY_SEPARATOR.'doctrine'.\DIRECTORY_SEPARATOR.'orm'.\DIRECTORY_SEPARATOR.'lib'.\DIRECTORY_SEPARATOR.'Doctrine'.\DIRECTORY_SEPARATOR.'ORM'.\DIRECTORY_SEPARATOR.'EntityManagerInterface.php';
include_once \dirname(__DIR__, 4).''.\DIRECTORY_SEPARATOR.'vendor'.\DIRECTORY_SEPARATOR.'doctrine'.\DIRECTORY_SEPARATOR.'orm'.\DIRECTORY_SEPARATOR.'lib'.\DIRECTORY_SEPARATOR.'Doctrine'.\DIRECTORY_SEPARATOR.'ORM'.\DIRECTORY_SEPARATOR.'EntityManager.php';

class EntityManager_9a5be93 extends \Doctrine\ORM\EntityManager implements \ProxyManager\Proxy\VirtualProxyInterface
{
    /**
     * @var \Doctrine\ORM\EntityManager|null wrapped object, if the proxy is initialized
     */
    private $valueHolderb63f5 = null;

    /**
     * @var \Closure|null initializer responsible for generating the wrapped object
     */
    private $initializerb0dfa = null;

    /**
     * @var bool[] map of public properties of the parent class
     */
    private static $publicPropertiesc4fdd = [
        
    ];

    public function getConnection()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getConnection', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getConnection();
    }

    public function getMetadataFactory()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getMetadataFactory', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getMetadataFactory();
    }

    public function getExpressionBuilder()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getExpressionBuilder', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getExpressionBuilder();
    }

    public function beginTransaction()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'beginTransaction', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->beginTransaction();
    }

    public function getCache()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getCache', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getCache();
    }

    public function transactional($func)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'transactional', array('func' => $func), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->transactional($func);
    }

    public function wrapInTransaction(callable $func)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'wrapInTransaction', array('func' => $func), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->wrapInTransaction($func);
    }

    public function commit()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'commit', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->commit();
    }

    public function rollback()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'rollback', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->rollback();
    }

    public function getClassMetadata($className)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getClassMetadata', array('className' => $className), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getClassMetadata($className);
    }

    public function createQuery($dql = '')
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'createQuery', array('dql' => $dql), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->createQuery($dql);
    }

    public function createNamedQuery($name)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'createNamedQuery', array('name' => $name), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->createNamedQuery($name);
    }

    public function createNativeQuery($sql, \Doctrine\ORM\Query\ResultSetMapping $rsm)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'createNativeQuery', array('sql' => $sql, 'rsm' => $rsm), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->createNativeQuery($sql, $rsm);
    }

    public function createNamedNativeQuery($name)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'createNamedNativeQuery', array('name' => $name), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->createNamedNativeQuery($name);
    }

    public function createQueryBuilder()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'createQueryBuilder', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->createQueryBuilder();
    }

    public function flush($entity = null)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'flush', array('entity' => $entity), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->flush($entity);
    }

    public function find($className, $id, $lockMode = null, $lockVersion = null)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'find', array('className' => $className, 'id' => $id, 'lockMode' => $lockMode, 'lockVersion' => $lockVersion), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->find($className, $id, $lockMode, $lockVersion);
    }

    public function getReference($entityName, $id)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getReference', array('entityName' => $entityName, 'id' => $id), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getReference($entityName, $id);
    }

    public function getPartialReference($entityName, $identifier)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getPartialReference', array('entityName' => $entityName, 'identifier' => $identifier), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getPartialReference($entityName, $identifier);
    }

    public function clear($entityName = null)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'clear', array('entityName' => $entityName), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->clear($entityName);
    }

    public function close()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'close', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->close();
    }

    public function persist($entity)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'persist', array('entity' => $entity), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->persist($entity);
    }

    public function remove($entity)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'remove', array('entity' => $entity), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->remove($entity);
    }

    public function refresh($entity)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'refresh', array('entity' => $entity), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->refresh($entity);
    }

    public function detach($entity)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'detach', array('entity' => $entity), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->detach($entity);
    }

    public function merge($entity)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'merge', array('entity' => $entity), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->merge($entity);
    }

    public function copy($entity, $deep = false)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'copy', array('entity' => $entity, 'deep' => $deep), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->copy($entity, $deep);
    }

    public function lock($entity, $lockMode, $lockVersion = null)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'lock', array('entity' => $entity, 'lockMode' => $lockMode, 'lockVersion' => $lockVersion), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->lock($entity, $lockMode, $lockVersion);
    }

    public function getRepository($entityName)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getRepository', array('entityName' => $entityName), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getRepository($entityName);
    }

    public function contains($entity)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'contains', array('entity' => $entity), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->contains($entity);
    }

    public function getEventManager()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getEventManager', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getEventManager();
    }

    public function getConfiguration()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getConfiguration', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getConfiguration();
    }

    public function isOpen()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'isOpen', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->isOpen();
    }

    public function getUnitOfWork()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getUnitOfWork', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getUnitOfWork();
    }

    public function getHydrator($hydrationMode)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getHydrator', array('hydrationMode' => $hydrationMode), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getHydrator($hydrationMode);
    }

    public function newHydrator($hydrationMode)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'newHydrator', array('hydrationMode' => $hydrationMode), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->newHydrator($hydrationMode);
    }

    public function getProxyFactory()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getProxyFactory', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getProxyFactory();
    }

    public function initializeObject($obj)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'initializeObject', array('obj' => $obj), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->initializeObject($obj);
    }

    public function getFilters()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'getFilters', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->getFilters();
    }

    public function isFiltersStateClean()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'isFiltersStateClean', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->isFiltersStateClean();
    }

    public function hasFilters()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'hasFilters', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return $this->valueHolderb63f5->hasFilters();
    }

    /**
     * Constructor for lazy initialization
     *
     * @param \Closure|null $initializer
     */
    public static function staticProxyConstructor($initializer)
    {
        static $reflection;

        $reflection = $reflection ?? new \ReflectionClass(__CLASS__);
        $instance   = $reflection->newInstanceWithoutConstructor();

        \Closure::bind(function (\Doctrine\ORM\EntityManager $instance) {
            unset($instance->config, $instance->conn, $instance->metadataFactory, $instance->unitOfWork, $instance->eventManager, $instance->proxyFactory, $instance->repositoryFactory, $instance->expressionBuilder, $instance->closed, $instance->filterCollection, $instance->cache);
        }, $instance, 'Doctrine\\ORM\\EntityManager')->__invoke($instance);

        $instance->initializerb0dfa = $initializer;

        return $instance;
    }

    protected function __construct(\Doctrine\DBAL\Connection $conn, \Doctrine\ORM\Configuration $config, \Doctrine\Common\EventManager $eventManager)
    {
        static $reflection;

        if (! $this->valueHolderb63f5) {
            $reflection = $reflection ?? new \ReflectionClass('Doctrine\\ORM\\EntityManager');
            $this->valueHolderb63f5 = $reflection->newInstanceWithoutConstructor();
        \Closure::bind(function (\Doctrine\ORM\EntityManager $instance) {
            unset($instance->config, $instance->conn, $instance->metadataFactory, $instance->unitOfWork, $instance->eventManager, $instance->proxyFactory, $instance->repositoryFactory, $instance->expressionBuilder, $instance->closed, $instance->filterCollection, $instance->cache);
        }, $this, 'Doctrine\\ORM\\EntityManager')->__invoke($this);

        }

        $this->valueHolderb63f5->__construct($conn, $config, $eventManager);
    }

    public function & __get($name)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, '__get', ['name' => $name], $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        if (isset(self::$publicPropertiesc4fdd[$name])) {
            return $this->valueHolderb63f5->$name;
        }

        $realInstanceReflection = new \ReflectionClass('Doctrine\\ORM\\EntityManager');

        if (! $realInstanceReflection->hasProperty($name)) {
            $targetObject = $this->valueHolderb63f5;

            $backtrace = debug_backtrace(false, 1);
            trigger_error(
                sprintf(
                    'Undefined property: %s::$%s in %s on line %s',
                    $realInstanceReflection->getName(),
                    $name,
                    $backtrace[0]['file'],
                    $backtrace[0]['line']
                ),
                \E_USER_NOTICE
            );
            return $targetObject->$name;
        }

        $targetObject = $this->valueHolderb63f5;
        $accessor = function & () use ($targetObject, $name) {
            return $targetObject->$name;
        };
        $backtrace = debug_backtrace(true, 2);
        $scopeObject = isset($backtrace[1]['object']) ? $backtrace[1]['object'] : new \ProxyManager\Stub\EmptyClassStub();
        $accessor = $accessor->bindTo($scopeObject, get_class($scopeObject));
        $returnValue = & $accessor();

        return $returnValue;
    }

    public function __set($name, $value)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, '__set', array('name' => $name, 'value' => $value), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        $realInstanceReflection = new \ReflectionClass('Doctrine\\ORM\\EntityManager');

        if (! $realInstanceReflection->hasProperty($name)) {
            $targetObject = $this->valueHolderb63f5;

            $targetObject->$name = $value;

            return $targetObject->$name;
        }

        $targetObject = $this->valueHolderb63f5;
        $accessor = function & () use ($targetObject, $name, $value) {
            $targetObject->$name = $value;

            return $targetObject->$name;
        };
        $backtrace = debug_backtrace(true, 2);
        $scopeObject = isset($backtrace[1]['object']) ? $backtrace[1]['object'] : new \ProxyManager\Stub\EmptyClassStub();
        $accessor = $accessor->bindTo($scopeObject, get_class($scopeObject));
        $returnValue = & $accessor();

        return $returnValue;
    }

    public function __isset($name)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, '__isset', array('name' => $name), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        $realInstanceReflection = new \ReflectionClass('Doctrine\\ORM\\EntityManager');

        if (! $realInstanceReflection->hasProperty($name)) {
            $targetObject = $this->valueHolderb63f5;

            return isset($targetObject->$name);
        }

        $targetObject = $this->valueHolderb63f5;
        $accessor = function () use ($targetObject, $name) {
            return isset($targetObject->$name);
        };
        $backtrace = debug_backtrace(true, 2);
        $scopeObject = isset($backtrace[1]['object']) ? $backtrace[1]['object'] : new \ProxyManager\Stub\EmptyClassStub();
        $accessor = $accessor->bindTo($scopeObject, get_class($scopeObject));
        $returnValue = $accessor();

        return $returnValue;
    }

    public function __unset($name)
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, '__unset', array('name' => $name), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        $realInstanceReflection = new \ReflectionClass('Doctrine\\ORM\\EntityManager');

        if (! $realInstanceReflection->hasProperty($name)) {
            $targetObject = $this->valueHolderb63f5;

            unset($targetObject->$name);

            return;
        }

        $targetObject = $this->valueHolderb63f5;
        $accessor = function () use ($targetObject, $name) {
            unset($targetObject->$name);

            return;
        };
        $backtrace = debug_backtrace(true, 2);
        $scopeObject = isset($backtrace[1]['object']) ? $backtrace[1]['object'] : new \ProxyManager\Stub\EmptyClassStub();
        $accessor = $accessor->bindTo($scopeObject, get_class($scopeObject));
        $accessor();
    }

    public function __clone()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, '__clone', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        $this->valueHolderb63f5 = clone $this->valueHolderb63f5;
    }

    public function __sleep()
    {
        $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, '__sleep', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;

        return array('valueHolderb63f5');
    }

    public function __wakeup()
    {
        \Closure::bind(function (\Doctrine\ORM\EntityManager $instance) {
            unset($instance->config, $instance->conn, $instance->metadataFactory, $instance->unitOfWork, $instance->eventManager, $instance->proxyFactory, $instance->repositoryFactory, $instance->expressionBuilder, $instance->closed, $instance->filterCollection, $instance->cache);
        }, $this, 'Doctrine\\ORM\\EntityManager')->__invoke($this);
    }

    public function setProxyInitializer(\Closure $initializer = null) : void
    {
        $this->initializerb0dfa = $initializer;
    }

    public function getProxyInitializer() : ?\Closure
    {
        return $this->initializerb0dfa;
    }

    public function initializeProxy() : bool
    {
        return $this->initializerb0dfa && ($this->initializerb0dfa->__invoke($valueHolderb63f5, $this, 'initializeProxy', array(), $this->initializerb0dfa) || 1) && $this->valueHolderb63f5 = $valueHolderb63f5;
    }

    public function isProxyInitialized() : bool
    {
        return null !== $this->valueHolderb63f5;
    }

    public function getWrappedValueHolderValue()
    {
        return $this->valueHolderb63f5;
    }
}

if (!\class_exists('EntityManager_9a5be93', false)) {
    \class_alias(__NAMESPACE__.'\\EntityManager_9a5be93', 'EntityManager_9a5be93', false);
}
