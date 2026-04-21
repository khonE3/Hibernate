# 🐻 Hibernate ORM — Complete Command Reference

คู่มือสรุปคำสั่ง Hibernate ORM ทั้งหมดที่ใช้บ่อย พร้อมตัวอย่างโค้ด Java สามารถใช้เป็น Cheatsheet ในการทำงานได้

---

## 📑 สารบัญ
1. [Configuration](#1-configuration)
2. [Entity Mapping Annotations](#2-entity-mapping-annotations)
3. [Session API (Core Operations)](#3-session-api-core-operations)
4. [Transaction Management](#4-transaction-management)
5. [HQL / JPQL Queries](#5-hql--jpql-queries)
6. [Criteria API](#6-criteria-api)
7. [Native SQL](#7-native-sql)
8. [Relationship Mapping](#8-relationship-mapping)
9. [Inheritance Mapping](#9-inheritance-mapping)
10. [Caching](#10-caching)
11. [Entity Lifecycle Callbacks](#11-entity-lifecycle-callbacks)
12. [Named Queries](#12-named-queries)
13. [Batch Processing](#13-batch-processing)

---

## 1. Configuration

### Hibernate XML (\`hibernate.cfg.xml\`)
การตั้งค่าแบบใช้ XML แบบดั้งเดิมของ Hibernate

```xml
<!DOCTYPE hibernate-configuration PUBLIC
        "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
        "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
    <session-factory>
        <!-- Database Connection -->
        <property name="hibernate.connection.driver_class">org.h2.Driver</property>
        <property name="hibernate.connection.url">jdbc:h2:mem:testdb</property>
        <property name="hibernate.connection.username">sa</property>
        <property name="hibernate.connection.password"></property>

        <!-- Hibernate Config -->
        <property name="hibernate.dialect">org.hibernate.dialect.H2Dialect</property>
        <property name="hibernate.show_sql">true</property>
        <property name="hibernate.format_sql">true</property>
        <property name="hibernate.hbm2ddl.auto">update</property>

        <!-- Mapping Entities -->
        <mapping class="com.example.entity.User"/>
    </session-factory>
</hibernate-configuration>
```

### JPA Configuration (\`persistence.xml\`)
การตั้งค่าตามมาตรฐาน JPA (แนะนำ) เก็บในโฟลเดอร์ \`META-INF\`

```xml
<persistence xmlns="http://xmlns.jcp.org/xml/ns/persistence" version="2.2">
    <persistence-unit name="my-pu">
        <provider>org.hibernate.jpa.HibernatePersistenceProvider</provider>
        <class>com.example.entity.User</class>
        <properties>
            <property name="javax.persistence.jdbc.driver" value="org.h2.Driver"/>
            <property name="javax.persistence.jdbc.url" value="jdbc:h2:mem:testdb"/>
            <property name="javax.persistence.jdbc.user" value="sa"/>
            <property name="javax.persistence.jdbc.password" value=""/>
            <property name="hibernate.dialect" value="org.hibernate.dialect.H2Dialect"/>
            <property name="hibernate.hbm2ddl.auto" value="update"/>
            <property name="hibernate.show_sql" value="true"/>
        </properties>
    </persistence-unit>
</persistence>
```

### SessionFactory Creation (Java)
การสร้าง SessionFactory แบบ Programmatic

```java
StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
    .configure() // โหลดจาก hibernate.cfg.xml
    .build();

SessionFactory sessionFactory = new MetadataSources(registry)
    .buildMetadata()
    .buildSessionFactory();
```

---

## 2. Entity Mapping Annotations

ตัวอย่างการแมป Entity ทั่วไป

```java
import javax.persistence.*;
import java.util.Date;
import java.math.BigDecimal;

@Entity
@Table(name = "users")
@org.hibernate.annotations.DynamicUpdate // อัปเดตเฉพาะฟิลด์ที่เปลี่ยน
@org.hibernate.annotations.DynamicInsert
public class User {

    // --- Primary Key ---
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // --- Basic Columns ---
    @Column(name = "full_name", nullable = false, length = 100, unique = true)
    private String name;

    // --- Ignore Field ---
    @Transient
    private String temporaryData;

    // --- Large Object (BLOB / CLOB) ---
    @Lob
    private byte[] profileImage;
    
    @Lob
    private String description;

    // --- Enums ---
    @Enumerated(EnumType.STRING)
    @Column(name = "user_role")
    private Role role; // enum Role { ADMIN, USER }

    // --- Dates ---
    @Temporal(TemporalType.TIMESTAMP) // DATE, TIME, หรือ TIMESTAMP
    private Date createdAt;

    // หรือใช้ Java 8 Time API (ไม่ต้องใช้ @Temporal)
    private java.time.LocalDateTime updatedAt;

    // --- Precision/Scale (Number) ---
    @Column(precision = 10, scale = 2)
    private BigDecimal balance;

    // --- Optimistic Locking ---
    @Version
    private Integer version;
}
```

### @Embedded / @Embeddable
รวมคลาสออบเจกต์เข้าเป็นคอลัมน์ในตารางเดียวกัน

```java
@Embeddable
public class Address {
    private String street;
    private String city;
    private String zipCode;
}

@Entity
public class Employee {
    @Id @GeneratedValue
    private Long id;
    
    @Embedded
    private Address homeAddress;
}
```

---

## 3. Session API (Core Operations)

การใช้งานเมธอดหลักๆ ของ \`Session\` หรือ \`EntityManager\`

```java
Session session = sessionFactory.openSession();
session.beginTransaction();

User user = new User();
user.setName("John Doe");

// ============================================
// 1. Insert (บันทึกข้อมูลใหม่)
// ============================================

// [JPA Standard] บันทึกเอนทิตีใหม่ กลับมาเป็น Managed state
session.persist(user); 

// [Hibernate Legacy] เหมือน persist แต่ return ID ทันที
Long id = (Long) session.save(user); 


// ============================================
// 2. Read (ดึงข้อมูล)
// ============================================

// อ่านทันที (Hit DB) หากไม่เจอ return null
User foundUser = session.get(User.class, 1L); 

// คืนค่า Proxy (Lazy) Hit DB เมื่อมีการเรียกใช้ หากไม่เจอ throw Exception
User proxyUser = session.load(User.class, 1L); 


// ============================================
// 3. Update (แก้ไขข้อมูล)
// ============================================

// [JPA Standard] คัดลอกค่าจาก Detached สู่ Managed Entity ที่มีในโหลด DB มา
User updatedUser = (User) session.merge(detachedUser); 

// [Hibernate Legacy] บังคับบันทึก Detached Entity กลับเข้าสู่ Context
session.update(detachedUser); 

// [Hibernate Legacy] ฉลาดพอที่จะเลือกว่าจะ save หรือ update ดูจาก ID
session.saveOrUpdate(detachedUser); 


// ============================================
// 4. Delete (ลบข้อมูล)
// ============================================

// [JPA Standard] ลบข้อมูล
session.remove(foundUser); 

// [Hibernate Legacy] ลบข้อมูลเหมือนกัน
session.delete(foundUser); 


// ============================================
// 5. Session State Management
// ============================================

// บังคับยิง SQL (INSERT/UPDATE/DELETE) ทันที ก่อน Commit
session.flush(); 

// ล้าง Context ทำให้ Entity ทั้งหมดกลายเป็น Detached
session.clear(); 

// ถอด Entity ตัวใดตัวหนึ่งออกจาก Context เป็น Detached
session.evict(user); 

// รีเฟรชดึงข้อมูลใหม่จาก DB ทับข้อมูลที่แก้ไขขใน Memory
session.refresh(foundUser); 

// เช็คว่า Context กำลังจัดการ Entity ตัวนี้อยู่ไหม?
boolean isManaged = session.contains(user); 

session.getTransaction().commit();
session.close();
```

---

## 4. Transaction Management

การจัดการ Transaction รันหลายคำสั่งแบบ All-or-Nothing

```java
Session session = sessionFactory.openSession();
Transaction tx = null;
try {
    tx = session.beginTransaction();
    
    // ... ทำการแก้ไขข้อมูล ...
    session.persist(newEntity);
    
    // ถ้ารวมคำสั่งสำเร็จ บันทึกลงฐานข้อมูล
    tx.commit();
} catch (Exception e) {
    if (tx != null) {
        // หากเกิด Error ยกเลิกคำสั่งทั้งหมด
        tx.rollback();
    }
    e.printStackTrace();
} finally {
    session.close();
}
```

---

## 5. HQL / JPQL Queries

ใช้ภาษาคล้าย SQL แต่อ้างอิงจากชื่อ Entity Class (ตัวพิมพ์ใหญ่-เล็กมีผล)

```java
// --- Select ทั้งหมด ---
String hql = "FROM User u";
List<User> users = session.createQuery(hql, User.class).getResultList();

// --- Select เฉพาะคอลัมน์ (Projection) ---
String hqlProj = "SELECT u.name, u.email FROM User u";
List<Object[]> names = session.createQuery(hqlProj).getResultList();

// --- ใส่ Parameter (Named) ---
String hqlWhere = "FROM User u WHERE u.age > :minAge AND u.role = :role";
List<User> filtered = session.createQuery(hqlWhere, User.class)
    .setParameter("minAge", 18)
    .setParameter("role", "ADMIN")
    .getResultList();

// --- Paging (Pagination) ---
session.createQuery("FROM User u ORDER BY u.createdAt DESC", User.class)
    .setFirstResult(0)  // Offset (เริ่มที่แถวที่เท่าไหร่)
    .setMaxResults(10)  // Limit (ดึงกี่แถว)
    .getResultList();

// --- Join (Fetch เพื่อหลีกเลี่ยง N+1 Problem) ---
String hqlJoin = "SELECT p FROM Post p JOIN FETCH p.author WHERE p.status = 'PUBLISHED'";
List<Post> posts = session.createQuery(hqlJoin, Post.class).getResultList();

// --- Aggregate Functions ---
Long count = (Long) session.createQuery("SELECT COUNT(u) FROM User u").uniqueResult();
Double avgAmount = (Double) session.createQuery("SELECT AVG(o.total) FROM Order o").uniqueResult();

// --- Bulk Update / Delete (ไม่สนใจ Cache) ---
int updatedEntities = session.createQuery("UPDATE User set status = 'INACTIVE' WHERE lastLogin < :date")
    .setParameter("date", oneYearAgo)
    .executeUpdate();
```

---

## 6. Criteria API

วิธีเขียน Query แบบใช้ Object/Method-chaining มีความปลอดภัยแบบ Type-Safe ลบปัญหาพิมพ์ HQL ผิด

```java
CriteriaBuilder cb = session.getCriteriaBuilder();
CriteriaQuery<User> cr = cb.createQuery(User.class);
Root<User> root = cr.from(User.class);

// --- เงื่อนไข (Where) ---
Predicate isAdult = cb.greaterThanOrEqualTo(root.get("age"), 18);
Predicate isActive = cb.equal(root.get("status"), "ACTIVE");
Predicate isNameLike = cb.like(root.get("name"), "John%");

cr.select(root).where(cb.and(isAdult, isActive, isNameLike));

// --- เรียงลำดับ (Order By) ---
cr.orderBy(cb.desc(root.get("createdAt")));

List<User> results = session.createQuery(cr).getResultList();
```

---

## 7. Native SQL

เมื่อ HQL ทำไม่ได้ ให้เขียน SQL แบบทั่วไป ตรงฐานข้อมูล

```java
// --- ดึงกลับมาเป็น Object Array ---
List<Object[]> objects = session.createNativeQuery("SELECT * FROM users WHERE active = 1")
    .getResultList();

// --- ดึงข้อมูลแมปกลับเป็น Entity (ใช้ {} ในบางเคส) ---
List<User> users = session.createNativeQuery("SELECT * FROM users WHERE active = 1")
    .addEntity(User.class)
    .getResultList();

// --- Native Bulk Operation ---
int count = session.createNativeQuery("DELETE FROM audit_logs WHERE created_at < '2020-01-01'")
    .executeUpdate();
```

---

## 8. Relationship Mapping

### 1. One-To-One
**ตัวอย่าง:** User มี 1 Profile

```java
@Entity
public class User {
    @Id @GeneratedValue
    private Long id;

    // การยืดโยง หากลบ User ให้ลบ Profile ถาวรไปด้วยเลย
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "profile_id")
    private UserProfile profile;
}

@Entity
public class UserProfile {
    @Id @GeneratedValue
    private Long id;

    // ฝั่งนี้จะชี้กลับ (Bidirectional) โดยอ้างถึง field 'profile' ในคลาส User
    @OneToOne(mappedBy = "profile")
    private User user;
}
```

### 2. One-To-Many / Many-To-One
**ตัวอย่าง:** Department เดียวมีหลาย Employee (และ Employees อยู่ใน Department เดียว)

```java
@Entity
public class Department {
    @Id @GeneratedValue
    private Long id;

    // Department เป็นเจ้าของทางลอจิก, mappedBy ชี้ไปที่ฟิลด์ `department` ใน Employee
    // fetch ทั่วไปของ OneToMany คือ LAZY
    @OneToMany(mappedBy = "department", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Employee> employees = new ArrayList<>();
}

@Entity
public class Employee {
    @Id @GeneratedValue
    private Long id;

    // Many-To-One ฝั่งนี้คือคนถือ Foreign Key เสมอ
    // fetch ทั่วไปของ ManyToOne คือ EAGER (ควรแก้เป็น LAZY)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "dept_id")
    private Department department;
}
```

### 3. Many-To-Many
**ตัวอย่าง:** Student ลงทะเบียนหลาย Course, Course มีหลาย Student

```java
@Entity
public class Student {
    @Id @GeneratedValue
    private Long id;

    // สร้างตารางกลางชื่อ student_course เชื่อม id
    @ManyToMany
    @JoinTable(
        name = "student_course",
        joinColumns = @JoinColumn(name = "student_id"),
        inverseJoinColumns = @JoinColumn(name = "course_id")
    )
    private Set<Course> courses = new HashSet<>();
}

@Entity
public class Course {
    @Id @GeneratedValue
    private Long id;

    @ManyToMany(mappedBy = "courses")
    private Set<Student> students = new HashSet<>();
}
```

---

## 9. Inheritance Mapping

การแมป Class แม่ลูก ลงสู่ตารางในฐานข้อมูล

### แบบ 1: SINGLE_TABLE (Default & เร็วสุด)
เทข้อมูลทุกคลาสรวมตารางเดียว แล้วใช้คอลัมน์บอกประเภท (Discriminator)

```java
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "vehicle_type", discriminatorType = DiscriminatorType.STRING)
public abstract class Vehicle {
    @Id @GeneratedValue private Long id;
    private String brand;
}

@Entity
@DiscriminatorValue("CAR")
public class Car extends Vehicle {
    private int numberOfDoors;
}

@Entity
@DiscriminatorValue("BIKE")
public class Bike extends Vehicle {
    private boolean hasBasket;
}
```

### แบบ 2: JOINED (เป็นระเบียบสุด)
สร้างตารางแยก 3 ตาราง แล้วใช้ FK โยงกัน (ช้าเวลา Query เพราะต้อง JOIN)

```java
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Animal {
    @Id @GeneratedValue private Long id;
}

@Entity
// ตาราง "dog" มีคอลัมน์ id โยงหาตาราง "animal"
public class Dog extends Animal {
    private String breed;
}
```

### แบบ 3: TABLE_PER_CLASS (ไม่แนะนำ)
ก๊อบปี้ Field พ่อแม่ลงไปในตารางลูกเลย จะได้ 2 ตารางที่ไม่เกี่ยวข้องกัน (Polymorphic query ช้ามากเนื่องจาก UNION)

```java
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class BillingDetails {
    @Id private Long id; // ไม่สามารถใช้ IDENTITY ได้
    private String owner;
}

@Entity
public class CreditCard extends BillingDetails {
    private String cardNumber;
}
```

---

## 10. Caching

### 1. First-Level Cache (Default เปิดให้อยู่แล้วผูกกับ Session)
ถ้าสั่ง \`session.get()\` ด้วย ID เดิม 2 รอบใน 1 Session จะ Select ไป DB รอบเดียว รอบสองเอาจาก Memory

### 2. Second-Level Cache (ต้องตั้งค่าเพิ่ม, ทำงานระดับ SessionFactory ข้าม Session ได้)

ตั้งค่าใน \`hibernate.cfg.xml\`:
```xml
<property name="hibernate.cache.use_second_level_cache">true</property>
<property name="hibernate.cache.region.factory_class">org.hibernate.cache.ehcache.EhCacheRegionFactory</property>
```

การแปะที่ Entity:
```java
@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Product {
    // ...
}
```

### 3. Query Cache
แค่เปิด Second-Level Cache เวลาสั่ง HQL ซ้ำจะไม่เก็บค่า หากอยากให้จำค่าผลลัพธ์ของ Query ต้องใส่:

```xml
<property name="hibernate.cache.use_query_cache">true</property>
```

ในโค้ด Java:
```java
List<Product> list = session.createQuery("FROM Product p", Product.class)
    .setCacheable(true) // ให้ยัดลง Query Cache
    .getResultList();
```

---

## 11. Entity Lifecycle Callbacks

ดัก Event เวลามีการเปลี่ยนแปลง Database (ช่วยอัปเดตพวกวันเวลาอัตโนมัติ)

```java
@Entity
public class Article {
    @Id @GeneratedValue
    private Long id;
    private Date createdAt;
    private Date updatedAt;

    // จะทำงานก่อนเรียก session.persist()
    @PrePersist
    protected void onCreate() {
        createdAt = new Date();
        updatedAt = new Date();
    }

    // จะทำงานก่อนเรียก session.update() / ตอน commit อัปเดตตาราง
    @PreUpdate
    protected void onUpdate() {
        updatedAt = new Date();
    }
    
    // หลังยิง INSERT เข้า DB แล้ว
    @PostPersist
    public void postPersist() {}
    
    // ก่อนลบ / หลังลบ
    @PreRemove / @PostRemove
    
    // หลังจากโหลดค่ามาจาก DB ใส่ตัวแปร Java แล้ว
    @PostLoad
}
```

หรือสร้าง Listener แยก:
```java
@Entity
@EntityListeners(AuditListener.class)
public class Order { /* ... */ }

public class AuditListener {
    @PrePersist
    public void prePersist(Object entity) {
        System.out.println("Saving: " + entity);
    }
}
```

---

## 12. Named Queries

ย้าย Query ไปเก็บเป็นสัดส่วนบนหัวคลาส ช่วยให้อ่านง่ายและทำงานเร็วขึ้นเพราะ Hibernate จะ Compile Query รอไว้ตั้งแต่ Start Server

```java
@Entity
@NamedQueries({
    @NamedQuery(name = "User.findByStatus", query = "FROM User u WHERE u.status = :status"),
    @NamedQuery(name = "User.findAllOrdered", query = "FROM User u ORDER BY u.id DESC")
})
public class User {
    //...
}

// วิธีเรียกใช้
List<User> activeUsers = session.createNamedQuery("User.findByStatus", User.class)
    .setParameter("status", "ACTIVE")
    .getResultList();
```

---

## 13. Batch Processing

หากลูปทำ \`session.persist()\` ทีละแสน record แรมจะระเบิดเพราะ First-Level Cache เก็บ Object ไว้ ทำให้ Out Of Memory ให้ flush แล้วเคลียร์เป็นระยะ

```xml
<!-- แนะนำให้ตั้งค่าใน hibernate.cfg.xml เพื่อให้ JDBC รวบคำสั่งวิ่งทีละก้อน -->
<property name="hibernate.jdbc.batch_size">50</property>
<property name="hibernate.order_inserts">true</property>
<property name="hibernate.order_updates">true</property>
```

```java
Session session = sessionFactory.openSession();
Transaction tx = session.beginTransaction();

for (int i = 0; i < 100000; i++) {
    User user = new User("User " + i);
    session.persist(user);

    // ทำการทยอย flush และ clear ทีละ 50
    if (i > 0 && i % 50 == 0) {
        session.flush();
        session.clear();
    }
}
tx.commit();
session.close();
```

---
*Created automatically for rapid development!* 🤎
