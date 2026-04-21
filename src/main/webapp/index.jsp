<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="คู่มือสรุปคำสั่ง Hibernate ORM ทั้งหมดพร้อมตัวอย่างโค้ด Java - ครอบคลุม Configuration, Annotations, Session API, HQL, Criteria API, Transaction, Caching และอื่นๆ">
    <title>Hibernate ORM — Complete Command Reference</title>
    <link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🐻</text></svg>">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- Background Effects -->
<div class="bg-effects">
    <div class="bg-orb bg-orb-1"></div>
    <div class="bg-orb bg-orb-2"></div>
    <div class="bg-orb bg-orb-3"></div>
    <div class="bg-grid"></div>
</div>

<!-- Mobile Toggle -->
<button class="mobile-toggle" id="mobileToggle" aria-label="Toggle menu">☰</button>

<!-- Sidebar Overlay -->
<div class="sidebar-overlay"></div>

<div class="app-container">

    <!-- ========== SIDEBAR ========== -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <a href="#" class="sidebar-logo">
                <div class="sidebar-logo-icon">H</div>
                <div class="sidebar-logo-text">
                    <h1>Hibernate</h1>
                    <span>Command Reference</span>
                </div>
            </a>
        </div>

        <div class="sidebar-search">
            <div class="sidebar-search-wrapper">
                <input type="text" id="sidebarSearch" placeholder="ค้นหาคำสั่ง...">
            </div>
        </div>

        <nav class="sidebar-nav">
            <div class="nav-group">
                <div class="nav-group-title">Getting Started</div>
                <a class="nav-link" data-section="sec-config">
                    <span class="nav-link-icon">⚙️</span> Configuration
                </a>
                <a class="nav-link" data-section="sec-entity">
                    <span class="nav-link-icon">📦</span> Entity Mapping
                    <span class="nav-link-badge">15</span>
                </a>
            </div>
            <div class="nav-group">
                <div class="nav-group-title">Core API</div>
                <a class="nav-link" data-section="sec-session">
                    <span class="nav-link-icon">🔌</span> Session API
                    <span class="nav-link-badge">12</span>
                </a>
                <a class="nav-link" data-section="sec-transaction">
                    <span class="nav-link-icon">🔒</span> Transaction
                </a>
            </div>
            <div class="nav-group">
                <div class="nav-group-title">Queries</div>
                <a class="nav-link" data-section="sec-hql">
                    <span class="nav-link-icon">📝</span> HQL / JPQL
                    <span class="nav-link-badge">10</span>
                </a>
                <a class="nav-link" data-section="sec-criteria">
                    <span class="nav-link-icon">🔎</span> Criteria API
                </a>
                <a class="nav-link" data-section="sec-native">
                    <span class="nav-link-icon">🗃️</span> Native SQL
                </a>
            </div>
            <div class="nav-group">
                <div class="nav-group-title">Relationships</div>
                <a class="nav-link" data-section="sec-relations">
                    <span class="nav-link-icon">🔗</span> Relationship Mapping
                    <span class="nav-link-badge">4</span>
                </a>
                <a class="nav-link" data-section="sec-inheritance">
                    <span class="nav-link-icon">📐</span> Inheritance
                </a>
            </div>
            <div class="nav-group">
                <div class="nav-group-title">Advanced</div>
                <a class="nav-link" data-section="sec-caching">
                    <span class="nav-link-icon">⚡</span> Caching
                </a>
                <a class="nav-link" data-section="sec-lifecycle">
                    <span class="nav-link-icon">🔄</span> Entity Lifecycle
                </a>
                <a class="nav-link" data-section="sec-named">
                    <span class="nav-link-icon">📌</span> Named Queries
                </a>
                <a class="nav-link" data-section="sec-batch">
                    <span class="nav-link-icon">📊</span> Batch Processing
                </a>
            </div>
        </nav>

        <div class="sidebar-footer">
            <div class="sidebar-footer-info">
                Hibernate ORM 5.6 &bull; Java 11+<br>
                <a href="https://hibernate.org/orm/documentation/" target="_blank">Official Docs ↗</a>
            </div>
        </div>
    </aside>

    <!-- ========== MAIN CONTENT ========== -->
    <main class="main-content">

        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-content">
                <div class="hero-badge">🐻 HIBERNATE ORM 5.6 &bull; COMPLETE REFERENCE</div>
                <h1>Hibernate Command<br>Reference Guide</h1>
                <p>คู่มือสรุปคำสั่ง Hibernate ORM ทั้งหมดสำหรับ Java Developer — ครอบคลุมตั้งแต่ Configuration, Annotations, Session API, HQL, Criteria API, Caching จนถึง Advanced Topics พร้อมตัวอย่างโค้ดที่ใช้งานได้จริง</p>
                <div class="hero-stats">
                    <div class="hero-stat">
                        <span class="hero-stat-number">60+</span>
                        <span class="hero-stat-label">คำสั่งทั้งหมด</span>
                    </div>
                    <div class="hero-stat">
                        <span class="hero-stat-number">13</span>
                        <span class="hero-stat-label">หมวดหมู่</span>
                    </div>
                    <div class="hero-stat">
                        <span class="hero-stat-number">50+</span>
                        <span class="hero-stat-label">ตัวอย่างโค้ด</span>
                    </div>
                    <div class="hero-stat">
                        <span class="hero-stat-number">H2</span>
                        <span class="hero-stat-label">Database</span>
                    </div>
                </div>
            </div>
        </section>

        <div class="content-area">

            <!-- ============================================================ -->
            <!-- SECTION 1: CONFIGURATION -->
            <!-- ============================================================ -->
            <section class="section" id="sec-config">
                <div class="section-header">
                    <div class="section-icon purple">⚙️</div>
                    <h2 class="section-title">Configuration</h2>
                </div>
                <p class="section-desc">การตั้งค่า Hibernate สามารถทำได้ผ่านไฟล์ <code>hibernate.cfg.xml</code> หรือ <code>persistence.xml</code> (JPA) โดยระบุ database connection, dialect และ properties ต่างๆ</p>

                <!-- hibernate.cfg.xml -->
                <div class="command-card open">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">hibernate.cfg.xml</span>
                            <span class="command-card-summary">ไฟล์ตั้งค่าหลักของ Hibernate</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-hibernate">Hibernate</span>
                            <span class="tag tag-important">สำคัญ</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <p>ไฟล์นี้ใช้กำหนดค่าการเชื่อมต่อฐานข้อมูล, SQL Dialect, Connection Pool และ Mapping Class ทั้งหมด วางไว้ใน <code>src/main/resources/</code></p>
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">XML</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="cm">&lt;?xml version="1.0" encoding="UTF-8"?&gt;</span>
<span class="cm">&lt;!DOCTYPE hibernate-configuration PUBLIC
    "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
    "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd"&gt;</span>

<span class="xml-tag">&lt;hibernate-configuration&gt;</span>
  <span class="xml-tag">&lt;session-factory&gt;</span>

    <span class="cm">&lt;!-- Database Connection (H2 In-Memory) --&gt;</span>
    <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.connection.driver_class"</span><span class="xml-tag">&gt;</span>org.h2.Driver<span class="xml-tag">&lt;/property&gt;</span>
    <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.connection.url"</span><span class="xml-tag">&gt;</span>jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1<span class="xml-tag">&lt;/property&gt;</span>
    <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.connection.username"</span><span class="xml-tag">&gt;</span>sa<span class="xml-tag">&lt;/property&gt;</span>
    <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.connection.password"</span><span class="xml-tag">&gt;</span><span class="xml-tag">&lt;/property&gt;</span>

    <span class="cm">&lt;!-- SQL Dialect --&gt;</span>
    <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.dialect"</span><span class="xml-tag">&gt;</span>org.hibernate.dialect.H2Dialect<span class="xml-tag">&lt;/property&gt;</span>

    <span class="cm">&lt;!-- DDL Strategy --&gt;</span>
    <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.hbm2ddl.auto"</span><span class="xml-tag">&gt;</span>update<span class="xml-tag">&lt;/property&gt;</span>

    <span class="cm">&lt;!-- Show SQL --&gt;</span>
    <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.show_sql"</span><span class="xml-tag">&gt;</span>true<span class="xml-tag">&lt;/property&gt;</span>
    <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.format_sql"</span><span class="xml-tag">&gt;</span>true<span class="xml-tag">&lt;/property&gt;</span>

    <span class="cm">&lt;!-- Entity Mapping --&gt;</span>
    <span class="xml-tag">&lt;mapping</span> <span class="xml-attr">class=</span><span class="xml-val">"com.hibernate.demo.entity.Employee"</span> <span class="xml-tag">/&gt;</span>
    <span class="xml-tag">&lt;mapping</span> <span class="xml-attr">class=</span><span class="xml-val">"com.hibernate.demo.entity.Department"</span> <span class="xml-tag">/&gt;</span>

  <span class="xml-tag">&lt;/session-factory&gt;</span>
<span class="xml-tag">&lt;/hibernate-configuration&gt;</span></code></pre>
                            </div>

                            <h4>Property สำคัญทั้งหมด:</h4>
                            <div class="table-wrapper">
                                <table>
                                    <thead>
                                        <tr><th>Property</th><th>คำอธิบาย</th><th>ค่าตัวอย่าง</th></tr>
                                    </thead>
                                    <tbody>
                                        <tr><td><code>connection.driver_class</code></td><td>JDBC Driver class</td><td>org.h2.Driver</td></tr>
                                        <tr><td><code>connection.url</code></td><td>JDBC URL</td><td>jdbc:h2:mem:testdb</td></tr>
                                        <tr><td><code>connection.username</code></td><td>DB username</td><td>sa</td></tr>
                                        <tr><td><code>connection.password</code></td><td>DB password</td><td>(ว่าง)</td></tr>
                                        <tr><td><code>dialect</code></td><td>SQL Dialect สำหรับ DB</td><td>org.hibernate.dialect.H2Dialect</td></tr>
                                        <tr><td><code>hbm2ddl.auto</code></td><td>DDL auto generation</td><td>create / update / validate / none</td></tr>
                                        <tr><td><code>show_sql</code></td><td>แสดง SQL ใน console</td><td>true / false</td></tr>
                                        <tr><td><code>format_sql</code></td><td>Format SQL ให้อ่านง่าย</td><td>true / false</td></tr>
                                        <tr><td><code>use_sql_comments</code></td><td>เพิ่ม comment ใน SQL</td><td>true / false</td></tr>
                                        <tr><td><code>current_session_context_class</code></td><td>Session context strategy</td><td>thread / jta / managed</td></tr>
                                        <tr><td><code>connection.pool_size</code></td><td>Connection pool size</td><td>10</td></tr>
                                        <tr><td><code>cache.use_second_level_cache</code></td><td>เปิด L2 cache</td><td>true / false</td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- SessionFactory -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">SessionFactory</span>
                            <span class="command-card-summary">สร้าง SessionFactory จาก Configuration</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-hibernate">Hibernate</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <p><code>SessionFactory</code> เป็น thread-safe object ที่สร้างขึ้นครั้งเดียวตลอด application lifecycle ใช้สำหรับสร้าง Session instances</p>
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="kw">import</span> org.hibernate.SessionFactory;
<span class="kw">import</span> org.hibernate.cfg.Configuration;

<span class="kw">public class</span> <span class="type">HibernateUtil</span> {

    <span class="kw">private static final</span> <span class="type">SessionFactory</span> sessionFactory;

    <span class="kw">static</span> {
        <span class="kw">try</span> {
            <span class="cm">// สร้าง SessionFactory จาก hibernate.cfg.xml</span>
            sessionFactory = <span class="kw">new</span> <span class="type">Configuration</span>()
                .<span class="fn">configure</span>(<span class="str">"hibernate.cfg.xml"</span>)
                .<span class="fn">buildSessionFactory</span>();
        } <span class="kw">catch</span> (<span class="type">Throwable</span> ex) {
            <span class="kw">throw new</span> <span class="type">ExceptionInInitializerError</span>(ex);
        }
    }

    <span class="kw">public static</span> <span class="type">SessionFactory</span> <span class="fn">getSessionFactory</span>() {
        <span class="kw">return</span> sessionFactory;
    }

    <span class="kw">public static void</span> <span class="fn">shutdown</span>() {
        sessionFactory.<span class="fn">close</span>();
    }
}</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- persistence.xml -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">persistence.xml</span>
                            <span class="command-card-summary">JPA Standard Configuration</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <p>ไฟล์ตั้งค่าแบบ JPA standard วางไว้ใน <code>src/main/resources/META-INF/persistence.xml</code></p>
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">XML</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="xml-tag">&lt;persistence</span> <span class="xml-attr">xmlns=</span><span class="xml-val">"http://xmlns.jcp.org/xml/ns/persistence"</span>
             <span class="xml-attr">version=</span><span class="xml-val">"2.2"</span><span class="xml-tag">&gt;</span>

  <span class="xml-tag">&lt;persistence-unit</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernateDemo"</span><span class="xml-tag">&gt;</span>
    <span class="xml-tag">&lt;provider&gt;</span>org.hibernate.jpa.HibernatePersistenceProvider<span class="xml-tag">&lt;/provider&gt;</span>
    <span class="xml-tag">&lt;class&gt;</span>com.hibernate.demo.entity.Employee<span class="xml-tag">&lt;/class&gt;</span>

    <span class="xml-tag">&lt;properties&gt;</span>
      <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"javax.persistence.jdbc.driver"</span>
                <span class="xml-attr">value=</span><span class="xml-val">"org.h2.Driver"</span> <span class="xml-tag">/&gt;</span>
      <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"javax.persistence.jdbc.url"</span>
                <span class="xml-attr">value=</span><span class="xml-val">"jdbc:h2:mem:testdb"</span> <span class="xml-tag">/&gt;</span>
      <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"javax.persistence.jdbc.user"</span>
                <span class="xml-attr">value=</span><span class="xml-val">"sa"</span> <span class="xml-tag">/&gt;</span>
      <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"javax.persistence.jdbc.password"</span>
                <span class="xml-attr">value=</span><span class="xml-val">""</span> <span class="xml-tag">/&gt;</span>
      <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.dialect"</span>
                <span class="xml-attr">value=</span><span class="xml-val">"org.hibernate.dialect.H2Dialect"</span> <span class="xml-tag">/&gt;</span>
      <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.hbm2ddl.auto"</span>
                <span class="xml-attr">value=</span><span class="xml-val">"update"</span> <span class="xml-tag">/&gt;</span>
      <span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.show_sql"</span>
                <span class="xml-attr">value=</span><span class="xml-val">"true"</span> <span class="xml-tag">/&gt;</span>
    <span class="xml-tag">&lt;/properties&gt;</span>
  <span class="xml-tag">&lt;/persistence-unit&gt;</span>
<span class="xml-tag">&lt;/persistence&gt;</span></code></pre>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ============================================================ -->
            <!-- SECTION 2: ENTITY MAPPING ANNOTATIONS -->
            <!-- ============================================================ -->
            <section class="section" id="sec-entity">
                <div class="section-header">
                    <div class="section-icon green">📦</div>
                    <h2 class="section-title">Entity Mapping Annotations</h2>
                </div>
                <p class="section-desc">Annotations สำหรับ map Java class ไปยัง database table — กำหนดชื่อตาราง, คอลัมน์, Primary Key, และ column constraints ต่างๆ</p>

                <!-- @Entity & @Table -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">@Entity / @Table</span>
                            <span class="command-card-summary">ประกาศ entity class และกำหนดชื่อตาราง</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                            <span class="tag tag-important">สำคัญ</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <p><code>@Entity</code> ทำให้ class เป็น persistent entity ที่ Hibernate จัดการให้ ส่วน <code>@Table</code> กำหนดรายละเอียดของตาราง</p>
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="kw">import</span> javax.persistence.*;

<span class="ann">@Entity</span>
<span class="ann">@Table</span>(name = <span class="str">"employees"</span>,
       schema = <span class="str">"public"</span>,
       uniqueConstraints = <span class="ann">@UniqueConstraint</span>(columnNames = {<span class="str">"email"</span>}))
<span class="kw">public class</span> <span class="type">Employee</span> {

    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;

    <span class="ann">@Column</span>(name = <span class="str">"full_name"</span>, nullable = <span class="kw">false</span>, length = <span class="num">100</span>)
    <span class="kw">private</span> <span class="type">String</span> name;

    <span class="ann">@Column</span>(unique = <span class="kw">true</span>, length = <span class="num">150</span>)
    <span class="kw">private</span> <span class="type">String</span> email;

    <span class="ann">@Column</span>(precision = <span class="num">10</span>, scale = <span class="num">2</span>)
    <span class="kw">private</span> <span class="type">Double</span> salary;

    <span class="cm">// Constructors, Getters, Setters...</span>
    <span class="kw">public</span> <span class="fn">Employee</span>() {}

    <span class="kw">public</span> <span class="fn">Employee</span>(<span class="type">String</span> name, <span class="type">String</span> email, <span class="type">Double</span> salary) {
        <span class="kw">this</span>.name = name;
        <span class="kw">this</span>.email = email;
        <span class="kw">this</span>.salary = salary;
    }
}</code></pre>
                            </div>
                            <div class="info-box tip">
                                <span class="info-box-icon">💡</span>
                                <div>Entity class ต้องมี no-arg constructor (public หรือ protected) และควร implement <code>Serializable</code></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- @Id & @GeneratedValue -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">@Id / @GeneratedValue</span>
                            <span class="command-card-summary">กำหนด Primary Key และ strategy การสร้าง ID</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="cm">// Strategy 1: IDENTITY — ใช้ auto-increment ของ DB</span>
<span class="ann">@Id</span>
<span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
<span class="kw">private</span> <span class="type">Long</span> id;

<span class="cm">// Strategy 2: SEQUENCE — ใช้ sequence ของ DB</span>
<span class="ann">@Id</span>
<span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.SEQUENCE,
               generator = <span class="str">"emp_seq"</span>)
<span class="ann">@SequenceGenerator</span>(name = <span class="str">"emp_seq"</span>,
                   sequenceName = <span class="str">"employee_sequence"</span>,
                   allocationSize = <span class="num">1</span>)
<span class="kw">private</span> <span class="type">Long</span> id;

<span class="cm">// Strategy 3: TABLE — ใช้ตารางแยกเก็บ ID</span>
<span class="ann">@Id</span>
<span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.TABLE,
               generator = <span class="str">"emp_table_gen"</span>)
<span class="ann">@TableGenerator</span>(name = <span class="str">"emp_table_gen"</span>,
                table = <span class="str">"id_generator"</span>,
                pkColumnName = <span class="str">"gen_name"</span>,
                valueColumnName = <span class="str">"gen_value"</span>,
                allocationSize = <span class="num">1</span>)
<span class="kw">private</span> <span class="type">Long</span> id;

<span class="cm">// Strategy 4: AUTO — Hibernate เลือกให้อัตโนมัติ</span>
<span class="ann">@Id</span>
<span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.AUTO)
<span class="kw">private</span> <span class="type">Long</span> id;</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- @Column -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">@Column</span>
                            <span class="command-card-summary">กำหนดรายละเอียดของ column ในตาราง</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="ann">@Column</span>(
    name = <span class="str">"full_name"</span>,           <span class="cm">// ชื่อ column ใน DB</span>
    nullable = <span class="kw">false</span>,              <span class="cm">// NOT NULL constraint</span>
    unique = <span class="kw">true</span>,                 <span class="cm">// UNIQUE constraint</span>
    length = <span class="num">100</span>,                  <span class="cm">// VARCHAR length</span>
    insertable = <span class="kw">true</span>,             <span class="cm">// รวมใน INSERT statement</span>
    updatable = <span class="kw">true</span>,              <span class="cm">// รวมใน UPDATE statement</span>
    columnDefinition = <span class="str">"TEXT"</span>,     <span class="cm">// กำหนด SQL type เอง</span>
    precision = <span class="num">10</span>,                <span class="cm">// สำหรับ decimal (ตัวเลขทั้งหมด)</span>
    scale = <span class="num">2</span>                       <span class="cm">// สำหรับ decimal (ทศนิยม)</span>
)
<span class="kw">private</span> <span class="type">String</span> name;</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- @Transient, @Lob, @Enumerated, @Temporal -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">@Transient / @Lob / @Enumerated / @Temporal</span>
                            <span class="command-card-summary">Annotations สำหรับ field พิเศษ</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="ann">@Entity</span>
<span class="kw">public class</span> <span class="type">Product</span> {

    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;

    <span class="cm">// @Transient — ไม่ถูกเก็บใน DB</span>
    <span class="ann">@Transient</span>
    <span class="kw">private</span> <span class="type">String</span> temporaryNote;

    <span class="cm">// @Lob — Large Object (CLOB/BLOB)</span>
    <span class="ann">@Lob</span>
    <span class="kw">private</span> <span class="type">String</span> description;     <span class="cm">// จะเป็น CLOB</span>

    <span class="ann">@Lob</span>
    <span class="kw">private</span> <span class="kw">byte</span>[] image;           <span class="cm">// จะเป็น BLOB</span>

    <span class="cm">// @Enumerated — เก็บ Enum value</span>
    <span class="ann">@Enumerated</span>(<span class="type">EnumType</span>.STRING)      <span class="cm">// เก็บเป็นชื่อ: "ACTIVE"</span>
    <span class="kw">private</span> <span class="type">Status</span> status;

    <span class="ann">@Enumerated</span>(<span class="type">EnumType</span>.ORDINAL)     <span class="cm">// เก็บเป็นตัวเลข: 0, 1, 2</span>
    <span class="kw">private</span> <span class="type">Category</span> category;

    <span class="cm">// @Temporal — สำหรับ java.util.Date</span>
    <span class="ann">@Temporal</span>(<span class="type">TemporalType</span>.DATE)       <span class="cm">// เก็บแค่วันที่</span>
    <span class="kw">private</span> <span class="type">Date</span> createdDate;

    <span class="ann">@Temporal</span>(<span class="type">TemporalType</span>.TIMESTAMP)  <span class="cm">// เก็บวันที่+เวลา</span>
    <span class="kw">private</span> <span class="type">Date</span> updatedAt;
}

<span class="kw">enum</span> <span class="type">Status</span> { ACTIVE, INACTIVE, PENDING }
<span class="kw">enum</span> <span class="type">Category</span> { ELECTRONICS, CLOTHING, FOOD }</code></pre>
                            </div>
                            <div class="info-box info">
                                <span class="info-box-icon">📌</span>
                                <div>Java 8+ Date/Time API (<code>LocalDate</code>, <code>LocalDateTime</code>) ไม่จำเป็นต้องใช้ <code>@Temporal</code> — Hibernate จะ map ให้อัตโนมัติ</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- @Embeddable / @Embedded -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">@Embeddable / @Embedded</span>
                            <span class="command-card-summary">ฝัง value object ไว้ในตารางเดียวกัน</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <p>ใช้ <code>@Embeddable</code> แยก value object เป็น class แยก แล้วฝังเข้าไปใน entity ด้วย <code>@Embedded</code> — column จะถูกรวมในตารางเดียวกัน</p>
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="ann">@Embeddable</span>
<span class="kw">public class</span> <span class="type">Address</span> {
    <span class="kw">private</span> <span class="type">String</span> street;
    <span class="kw">private</span> <span class="type">String</span> city;
    <span class="kw">private</span> <span class="type">String</span> zipCode;
    <span class="kw">private</span> <span class="type">String</span> country;
    <span class="cm">// Constructors, Getters, Setters...</span>
}

<span class="ann">@Entity</span>
<span class="ann">@Table</span>(name = <span class="str">"employees"</span>)
<span class="kw">public class</span> <span class="type">Employee</span> {

    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;

    <span class="kw">private</span> <span class="type">String</span> name;

    <span class="ann">@Embedded</span>
    <span class="kw">private</span> <span class="type">Address</span> homeAddress;

    <span class="ann">@Embedded</span>
    <span class="ann">@AttributeOverrides</span>({
        <span class="ann">@AttributeOverride</span>(name = <span class="str">"street"</span>,
            column = <span class="ann">@Column</span>(name = <span class="str">"work_street"</span>)),
        <span class="ann">@AttributeOverride</span>(name = <span class="str">"city"</span>,
            column = <span class="ann">@Column</span>(name = <span class="str">"work_city"</span>)),
        <span class="ann">@AttributeOverride</span>(name = <span class="str">"zipCode"</span>,
            column = <span class="ann">@Column</span>(name = <span class="str">"work_zip"</span>)),
        <span class="ann">@AttributeOverride</span>(name = <span class="str">"country"</span>,
            column = <span class="ann">@Column</span>(name = <span class="str">"work_country"</span>))
    })
    <span class="kw">private</span> <span class="type">Address</span> workAddress;
}</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- @Version -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">@Version</span>
                            <span class="command-card-summary">Optimistic Locking — ป้องกัน concurrent update</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="ann">@Entity</span>
<span class="kw">public class</span> <span class="type">Product</span> {

    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;

    <span class="kw">private</span> <span class="type">String</span> name;

    <span class="ann">@Version</span>
    <span class="kw">private</span> <span class="type">Integer</span> version;
    <span class="cm">// Hibernate จะเพิ่ม version +1 ทุกครั้งที่ update</span>
    <span class="cm">// ถ้า version ไม่ตรง → OptimisticLockException</span>
}</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Hibernate-specific annotations -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">@DynamicInsert / @DynamicUpdate / @NaturalId</span>
                            <span class="command-card-summary">Hibernate-specific annotations</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-hibernate">Hibernate</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="kw">import</span> org.hibernate.annotations.*;

<span class="ann">@Entity</span>
<span class="ann">@DynamicInsert</span>   <span class="cm">// INSERT เฉพาะ column ที่ไม่เป็น null</span>
<span class="ann">@DynamicUpdate</span>   <span class="cm">// UPDATE เฉพาะ column ที่เปลี่ยนแปลง</span>
<span class="kw">public class</span> <span class="type">User</span> {

    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;

    <span class="ann">@NaturalId</span>     <span class="cm">// Business key — immutable, unique</span>
    <span class="kw">private</span> <span class="type">String</span> email;

    <span class="kw">private</span> <span class="type">String</span> name;

    <span class="ann">@CreationTimestamp</span>   <span class="cm">// บันทึกเวลาตอนสร้าง</span>
    <span class="kw">private</span> <span class="type">LocalDateTime</span> createdAt;

    <span class="ann">@UpdateTimestamp</span>     <span class="cm">// บันทึกเวลาตอนอัพเดท</span>
    <span class="kw">private</span> <span class="type">LocalDateTime</span> updatedAt;

    <span class="ann">@Formula</span>(<span class="str">"salary * 12"</span>)   <span class="cm">// คำนวณจาก SQL expression</span>
    <span class="kw">private</span> <span class="type">Double</span> annualSalary;
}</code></pre>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ============================================================ -->
            <!-- SECTION 3: SESSION API -->
            <!-- ============================================================ -->
            <section class="section" id="sec-session">
                <div class="section-header">
                    <div class="section-icon blue">🔌</div>
                    <h2 class="section-title">Session API</h2>
                </div>
                <p class="section-desc">Session เป็น core interface ของ Hibernate สำหรับ CRUD operations — เป็น first-level cache และ unit of work pattern</p>

                <!-- persist() -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">session.persist()</span>
                            <span class="command-card-summary">บันทึก entity ใหม่ลง DB (INSERT)</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                            <span class="tag tag-important">แนะนำ</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <p>เปลี่ยนสถานะ entity จาก <strong>Transient → Persistent</strong> — SQL INSERT จะถูก execute ตอน flush/commit</p>
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();
<span class="type">Transaction</span> tx = session.<span class="fn">beginTransaction</span>();

<span class="type">Employee</span> emp = <span class="kw">new</span> <span class="type">Employee</span>();
emp.<span class="fn">setName</span>(<span class="str">"สมชาย ใจดี"</span>);
emp.<span class="fn">setEmail</span>(<span class="str">"somchai@example.com"</span>);
emp.<span class="fn">setSalary</span>(<span class="num">50000.00</span>);

session.<span class="fn">persist</span>(emp);   <span class="cm">// Transient → Persistent</span>
<span class="cm">// emp.getId() จะยังเป็น null ในบาง strategy</span>

tx.<span class="fn">commit</span>();             <span class="cm">// SQL INSERT ถูก execute</span>
session.<span class="fn">close</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- save() -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">session.save()</span>
                            <span class="command-card-summary">บันทึก entity ใหม่ + return generated ID</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-hibernate">Hibernate</span>
                            <span class="tag tag-deprecated">Deprecated</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <p>คล้าย <code>persist()</code> แต่ return <code>Serializable</code> ID — <strong>deprecated ใน Hibernate 6+</strong> ใช้ <code>persist()</code> แทน</p>
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();
<span class="type">Transaction</span> tx = session.<span class="fn">beginTransaction</span>();

<span class="type">Employee</span> emp = <span class="kw">new</span> <span class="type">Employee</span>(<span class="str">"สมหญิง รักเรียน"</span>, <span class="str">"somying@example.com"</span>, <span class="num">45000.0</span>);

<span class="type">Serializable</span> id = session.<span class="fn">save</span>(emp);  <span class="cm">// return ID ทันที</span>
<span class="type">System</span>.out.<span class="fn">println</span>(<span class="str">"Generated ID: "</span> + id);

tx.<span class="fn">commit</span>();
session.<span class="fn">close</span>();</code></pre>
                            </div>
                            <div class="info-box warning">
                                <span class="info-box-icon">⚠️</span>
                                <div><code>save()</code> ถูก deprecated ใน Hibernate 6.0+ แนะนำใช้ <code>persist()</code> แทน</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- get() & load() -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">session.get() / session.load()</span>
                            <span class="command-card-summary">ดึง entity จาก DB ด้วย Primary Key</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-hibernate">Hibernate</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();

<span class="cm">// get() — query DB ทันที, return null ถ้าไม่เจอ</span>
<span class="type">Employee</span> emp1 = session.<span class="fn">get</span>(<span class="type">Employee</span>.<span class="kw">class</span>, <span class="num">1L</span>);
<span class="kw">if</span> (emp1 != <span class="kw">null</span>) {
    <span class="type">System</span>.out.<span class="fn">println</span>(emp1.<span class="fn">getName</span>());
}

<span class="cm">// load() — return proxy (lazy), exception ถ้าไม่เจอ</span>
<span class="kw">try</span> {
    <span class="type">Employee</span> emp2 = session.<span class="fn">load</span>(<span class="type">Employee</span>.<span class="kw">class</span>, <span class="num">2L</span>);
    <span class="cm">// SQL query จะเกิดตอนเรียก property</span>
    <span class="type">System</span>.out.<span class="fn">println</span>(emp2.<span class="fn">getName</span>()); <span class="cm">// SELECT ที่ตรงนี้</span>
} <span class="kw">catch</span> (<span class="type">ObjectNotFoundException</span> e) {
    <span class="type">System</span>.out.<span class="fn">println</span>(<span class="str">"ไม่พบ Employee"</span>);
}

session.<span class="fn">close</span>();</code></pre>
                            </div>
                            <div class="table-wrapper">
                                <table>
                                    <thead>
                                        <tr><th>ฟีเจอร์</th><th><code>get()</code></th><th><code>load()</code></th></tr>
                                    </thead>
                                    <tbody>
                                        <tr><td>Loading</td><td>Eager (ทันที)</td><td>Lazy (proxy)</td></tr>
                                        <tr><td>ไม่เจอข้อมูล</td><td>return <code>null</code></td><td>throw <code>ObjectNotFoundException</code></td></tr>
                                        <tr><td>Query DB</td><td>ทันที</td><td>ตอนเรียก property แรก</td></tr>
                                        <tr><td>JPA equivalent</td><td><code>find()</code></td><td><code>getReference()</code></td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- update() -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">session.update()</span>
                            <span class="command-card-summary">Re-attach detached entity กลับเข้า session</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-hibernate">Hibernate</span>
                            <span class="tag tag-deprecated">Deprecated</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="cm">// ดึง entity จาก session แรก</span>
<span class="type">Session</span> session1 = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();
<span class="type">Employee</span> emp = session1.<span class="fn">get</span>(<span class="type">Employee</span>.<span class="kw">class</span>, <span class="num">1L</span>);
session1.<span class="fn">close</span>();  <span class="cm">// emp กลายเป็น detached</span>

<span class="cm">// แก้ไขขณะ detached</span>
emp.<span class="fn">setSalary</span>(<span class="num">75000.0</span>);

<span class="cm">// Re-attach ใน session ใหม่</span>
<span class="type">Session</span> session2 = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();
<span class="type">Transaction</span> tx = session2.<span class="fn">beginTransaction</span>();

session2.<span class="fn">update</span>(emp);  <span class="cm">// Detached → Persistent</span>

tx.<span class="fn">commit</span>();
session2.<span class="fn">close</span>();</code></pre>
                            </div>
                            <div class="info-box warning">
                                <span class="info-box-icon">⚠️</span>
                                <div><code>update()</code> ถูก deprecated ใน Hibernate 6+ แนะนำใช้ <code>merge()</code> แทน</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- merge() -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">session.merge()</span>
                            <span class="command-card-summary">Copy state จาก detached entity ไปยัง persistent</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                            <span class="tag tag-important">แนะนำ</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <p><code>merge()</code> จะ copy state ของ detached object ไปยัง persistent copy — return ตัว persistent object ใหม่</p>
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="cm">// สมมุติ emp เป็น detached (จาก REST API, form, etc.)</span>
<span class="type">Employee</span> detachedEmp = <span class="kw">new</span> <span class="type">Employee</span>();
detachedEmp.<span class="fn">setId</span>(<span class="num">1L</span>);
detachedEmp.<span class="fn">setName</span>(<span class="str">"Updated Name"</span>);
detachedEmp.<span class="fn">setSalary</span>(<span class="num">80000.0</span>);

<span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();
<span class="type">Transaction</span> tx = session.<span class="fn">beginTransaction</span>();

<span class="cm">// merge return persistent copy (ไม่ใช่ตัว detachedEmp)</span>
<span class="type">Employee</span> managedEmp = (<span class="type">Employee</span>) session.<span class="fn">merge</span>(detachedEmp);

<span class="type">System</span>.out.<span class="fn">println</span>(managedEmp == detachedEmp);  <span class="cm">// false</span>

tx.<span class="fn">commit</span>();
session.<span class="fn">close</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- delete() / remove() -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">session.delete() / session.remove()</span>
                            <span class="command-card-summary">ลบ entity จาก DB (DELETE)</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();
<span class="type">Transaction</span> tx = session.<span class="fn">beginTransaction</span>();

<span class="cm">// ต้อง get entity ก่อน (ต้องเป็น persistent state)</span>
<span class="type">Employee</span> emp = session.<span class="fn">get</span>(<span class="type">Employee</span>.<span class="kw">class</span>, <span class="num">1L</span>);

<span class="kw">if</span> (emp != <span class="kw">null</span>) {
    session.<span class="fn">remove</span>(emp);   <span class="cm">// JPA standard (แนะนำ)</span>
    <span class="cm">// session.delete(emp);  // Hibernate-specific (deprecated)</span>
}

tx.<span class="fn">commit</span>();
session.<span class="fn">close</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- saveOrUpdate() -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">session.saveOrUpdate()</span>
                            <span class="command-card-summary">INSERT ถ้าใหม่ หรือ UPDATE ถ้ามีอยู่แล้ว</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-hibernate">Hibernate</span>
                            <span class="tag tag-deprecated">Deprecated</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();
<span class="type">Transaction</span> tx = session.<span class="fn">beginTransaction</span>();

<span class="type">Employee</span> emp = <span class="kw">new</span> <span class="type">Employee</span>();
emp.<span class="fn">setName</span>(<span class="str">"New Employee"</span>);

<span class="cm">// ถ้า id เป็น null → INSERT</span>
<span class="cm">// ถ้า id มีค่า → UPDATE</span>
session.<span class="fn">saveOrUpdate</span>(emp);

tx.<span class="fn">commit</span>();
session.<span class="fn">close</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- flush(), clear(), evict(), refresh() -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">flush() / clear() / evict() / refresh()</span>
                            <span class="command-card-summary">จัดการ Session cache (First-level cache)</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-hibernate">Hibernate</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();
<span class="type">Transaction</span> tx = session.<span class="fn">beginTransaction</span>();

<span class="type">Employee</span> emp = session.<span class="fn">get</span>(<span class="type">Employee</span>.<span class="kw">class</span>, <span class="num">1L</span>);
emp.<span class="fn">setSalary</span>(<span class="num">99000.0</span>);

<span class="cm">// flush() — sync pending changes กับ DB ทันที</span>
session.<span class="fn">flush</span>();   <span class="cm">// SQL UPDATE ถูก execute ทันที</span>

<span class="cm">// refresh() — โหลดข้อมูลจาก DB มาทับ</span>
session.<span class="fn">refresh</span>(emp);  <span class="cm">// SELECT ใหม่จาก DB</span>

<span class="cm">// evict() — ลบ entity ออกจาก session cache</span>
session.<span class="fn">evict</span>(emp);    <span class="cm">// emp กลายเป็น detached</span>

<span class="cm">// clear() — ลบ entity ทั้งหมดออกจาก session cache</span>
session.<span class="fn">clear</span>();       <span class="cm">// ล้าง first-level cache ทั้งหมด</span>

<span class="cm">// contains() — ตรวจสอบว่า entity อยู่ใน session cache หรือไม่</span>
<span class="kw">boolean</span> managed = session.<span class="fn">contains</span>(emp);  <span class="cm">// false (เพราะ evict แล้ว)</span>

tx.<span class="fn">commit</span>();
session.<span class="fn">close</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- createQuery -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">session.createQuery()</span>
                            <span class="command-card-summary">สร้าง HQL/JPQL query</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                            <span class="tag tag-query">Query</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();

<span class="cm">// ดึงทั้งหมด</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; all = session
    .<span class="fn">createQuery</span>(<span class="str">"FROM Employee"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">getResultList</span>();

<span class="cm">// ค้นหาด้วย parameter</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; results = session
    .<span class="fn">createQuery</span>(<span class="str">"FROM Employee e WHERE e.salary > :minSalary"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">setParameter</span>(<span class="str">"minSalary"</span>, <span class="num">50000.0</span>)
    .<span class="fn">getResultList</span>();

<span class="cm">// ดึงแค่ตัวเดียว</span>
<span class="type">Employee</span> single = session
    .<span class="fn">createQuery</span>(<span class="str">"FROM Employee e WHERE e.email = :email"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">setParameter</span>(<span class="str">"email"</span>, <span class="str">"somchai@example.com"</span>)
    .<span class="fn">uniqueResult</span>();

<span class="cm">// Pagination</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; paged = session
    .<span class="fn">createQuery</span>(<span class="str">"FROM Employee ORDER BY id"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">setFirstResult</span>(<span class="num">0</span>)      <span class="cm">// offset</span>
    .<span class="fn">setMaxResults</span>(<span class="num">10</span>)      <span class="cm">// limit</span>
    .<span class="fn">getResultList</span>();

session.<span class="fn">close</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ============================================================ -->
            <!-- SECTION 4: TRANSACTION -->
            <!-- ============================================================ -->
            <section class="section" id="sec-transaction">
                <div class="section-header">
                    <div class="section-icon orange">🔒</div>
                    <h2 class="section-title">Transaction Management</h2>
                </div>
                <p class="section-desc">ทุกการเปลี่ยนแปลงข้อมูลใน Hibernate ต้องอยู่ภายใน Transaction — ใช้ beginTransaction, commit และ rollback</p>

                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">Transaction Pattern</span>
                            <span class="command-card-summary">รูปแบบมาตรฐานของ Transaction handling</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-important">สำคัญ</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="type">Session</span> session = <span class="kw">null</span>;
<span class="type">Transaction</span> tx = <span class="kw">null</span>;

<span class="kw">try</span> {
    session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();
    tx = session.<span class="fn">beginTransaction</span>();

    <span class="cm">// ==========================================</span>
    <span class="cm">// Business Logic ที่นี่</span>
    <span class="cm">// ==========================================</span>
    <span class="type">Employee</span> emp = <span class="kw">new</span> <span class="type">Employee</span>(<span class="str">"สมศรี"</span>, <span class="str">"somsri@example.com"</span>, <span class="num">60000.0</span>);
    session.<span class="fn">persist</span>(emp);

    <span class="type">Employee</span> existing = session.<span class="fn">get</span>(<span class="type">Employee</span>.<span class="kw">class</span>, <span class="num">2L</span>);
    <span class="kw">if</span> (existing != <span class="kw">null</span>) {
        existing.<span class="fn">setSalary</span>(<span class="num">70000.0</span>);  <span class="cm">// dirty checking จะ auto-update</span>
    }

    tx.<span class="fn">commit</span>();    <span class="cm">// สำเร็จ → commit</span>

} <span class="kw">catch</span> (<span class="type">Exception</span> e) {
    <span class="kw">if</span> (tx != <span class="kw">null</span>) {
        tx.<span class="fn">rollback</span>();  <span class="cm">// ผิดพลาด → rollback</span>
    }
    e.<span class="fn">printStackTrace</span>();
} <span class="kw">finally</span> {
    <span class="kw">if</span> (session != <span class="kw">null</span>) {
        session.<span class="fn">close</span>();  <span class="cm">// ปิด session เสมอ</span>
    }
}</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Try-with-resources -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">doInTransaction() Helper</span>
                            <span class="command-card-summary">Reusable transaction wrapper pattern</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-important">Best Practice</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="kw">import</span> java.util.function.Consumer;

<span class="kw">public class</span> <span class="type">TransactionHelper</span> {

    <span class="kw">public static void</span> <span class="fn">doInTransaction</span>(<span class="type">Consumer</span>&lt;<span class="type">Session</span>&gt; action) {
        <span class="type">Transaction</span> tx = <span class="kw">null</span>;
        <span class="kw">try</span> (<span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>()) {
            tx = session.<span class="fn">beginTransaction</span>();
            action.<span class="fn">accept</span>(session);
            tx.<span class="fn">commit</span>();
        } <span class="kw">catch</span> (<span class="type">Exception</span> e) {
            <span class="kw">if</span> (tx != <span class="kw">null</span>) tx.<span class="fn">rollback</span>();
            <span class="kw">throw</span> e;
        }
    }
}

<span class="cm">// ใช้งาน:</span>
<span class="type">TransactionHelper</span>.<span class="fn">doInTransaction</span>(session -> {
    <span class="type">Employee</span> emp = <span class="kw">new</span> <span class="type">Employee</span>(<span class="str">"Test"</span>, <span class="str">"test@example.com"</span>, <span class="num">50000.0</span>);
    session.<span class="fn">persist</span>(emp);
});</code></pre>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ============================================================ -->
            <!-- SECTION 5: HQL / JPQL -->
            <!-- ============================================================ -->
            <section class="section" id="sec-hql">
                <div class="section-header">
                    <div class="section-icon purple">📝</div>
                    <h2 class="section-title">HQL / JPQL Queries</h2>
                </div>
                <p class="section-desc">Hibernate Query Language (HQL) คือ object-oriented query language คล้าย SQL แต่ใช้ชื่อ entity/property แทนชื่อ table/column — JPQL คือ JPA subset ของ HQL</p>

                <!-- SELECT -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">SELECT / FROM</span>
                            <span class="command-card-summary">ดึงข้อมูลจาก entity</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-query">Query</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="cm">// ดึงทุก field</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; all = session
    .<span class="fn">createQuery</span>(<span class="str">"SELECT e FROM Employee e"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">getResultList</span>();

<span class="cm">// ดึงเฉพาะบาง field (Projection)</span>
<span class="type">List</span>&lt;<span class="type">Object</span>[]&gt; partial = session
    .<span class="fn">createQuery</span>(<span class="str">"SELECT e.name, e.salary FROM Employee e"</span>, <span class="type">Object</span>[].<span class="kw">class</span>)
    .<span class="fn">getResultList</span>();

<span class="kw">for</span> (<span class="type">Object</span>[] row : partial) {
    <span class="type">System</span>.out.<span class="fn">println</span>(<span class="str">"Name: "</span> + row[<span class="num">0</span>] + <span class="str">", Salary: "</span> + row[<span class="num">1</span>]);
}

<span class="cm">// ดึง distinct</span>
<span class="type">List</span>&lt;<span class="type">String</span>&gt; departments = session
    .<span class="fn">createQuery</span>(<span class="str">"SELECT DISTINCT e.department FROM Employee e"</span>, <span class="type">String</span>.<span class="kw">class</span>)
    .<span class="fn">getResultList</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- WHERE -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">WHERE / AND / OR / LIKE / IN / BETWEEN</span>
                            <span class="command-card-summary">เงื่อนไขการกรองข้อมูล</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-query">Query</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="cm">// WHERE + Named Parameter</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; list1 = session.<span class="fn">createQuery</span>(
    <span class="str">"FROM Employee e WHERE e.salary > :min AND e.salary < :max"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">setParameter</span>(<span class="str">"min"</span>, <span class="num">30000.0</span>)
    .<span class="fn">setParameter</span>(<span class="str">"max"</span>, <span class="num">80000.0</span>)
    .<span class="fn">getResultList</span>();

<span class="cm">// LIKE</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; list2 = session.<span class="fn">createQuery</span>(
    <span class="str">"FROM Employee e WHERE e.name LIKE :pattern"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">setParameter</span>(<span class="str">"pattern"</span>, <span class="str">"%สม%"</span>)
    .<span class="fn">getResultList</span>();

<span class="cm">// IN</span>
<span class="type">List</span>&lt;<span class="type">String</span>&gt; depts = <span class="type">Arrays</span>.<span class="fn">asList</span>(<span class="str">"IT"</span>, <span class="str">"HR"</span>, <span class="str">"Finance"</span>);
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; list3 = session.<span class="fn">createQuery</span>(
    <span class="str">"FROM Employee e WHERE e.department IN :depts"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">setParameter</span>(<span class="str">"depts"</span>, depts)
    .<span class="fn">getResultList</span>();

<span class="cm">// BETWEEN</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; list4 = session.<span class="fn">createQuery</span>(
    <span class="str">"FROM Employee e WHERE e.salary BETWEEN :low AND :high"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">setParameter</span>(<span class="str">"low"</span>, <span class="num">40000.0</span>)
    .<span class="fn">setParameter</span>(<span class="str">"high"</span>, <span class="num">100000.0</span>)
    .<span class="fn">getResultList</span>();

<span class="cm">// IS NULL / IS NOT NULL</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; list5 = session.<span class="fn">createQuery</span>(
    <span class="str">"FROM Employee e WHERE e.email IS NOT NULL"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">getResultList</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- JOIN -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">JOIN / LEFT JOIN / FETCH JOIN</span>
                            <span class="command-card-summary">เชื่อมตารางใน HQL</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-query">Query</span>
                            <span class="tag tag-important">สำคัญ</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="cm">// INNER JOIN</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; joined = session.<span class="fn">createQuery</span>(
    <span class="str">"SELECT e FROM Employee e JOIN e.department d WHERE d.name = :dept"</span>,
    <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">setParameter</span>(<span class="str">"dept"</span>, <span class="str">"IT"</span>)
    .<span class="fn">getResultList</span>();

<span class="cm">// LEFT JOIN</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; leftJoined = session.<span class="fn">createQuery</span>(
    <span class="str">"SELECT e FROM Employee e LEFT JOIN e.department d"</span>,
    <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">getResultList</span>();

<span class="cm">// JOIN FETCH — ดึง lazy association มาพร้อมกัน</span>
<span class="cm">// (ป้องกัน LazyInitializationException)</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; fetched = session.<span class="fn">createQuery</span>(
    <span class="str">"SELECT e FROM Employee e JOIN FETCH e.department"</span>,
    <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">getResultList</span>();</code></pre>
                            </div>
                            <div class="info-box tip">
                                <span class="info-box-icon">💡</span>
                                <div><code>JOIN FETCH</code> เป็นวิธีที่ดีที่สุดในการแก้ปัญหา <strong>N+1 Query Problem</strong> และ <code>LazyInitializationException</code></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Aggregate Functions -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">COUNT / SUM / AVG / MIN / MAX / GROUP BY</span>
                            <span class="command-card-summary">Aggregate functions และ Grouping</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-query">Query</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="cm">// COUNT</span>
<span class="type">Long</span> count = session.<span class="fn">createQuery</span>(
    <span class="str">"SELECT COUNT(e) FROM Employee e"</span>, <span class="type">Long</span>.<span class="kw">class</span>)
    .<span class="fn">uniqueResult</span>();

<span class="cm">// AVG</span>
<span class="type">Double</span> avgSalary = session.<span class="fn">createQuery</span>(
    <span class="str">"SELECT AVG(e.salary) FROM Employee e"</span>, <span class="type">Double</span>.<span class="kw">class</span>)
    .<span class="fn">uniqueResult</span>();

<span class="cm">// SUM</span>
<span class="type">Double</span> totalSalary = session.<span class="fn">createQuery</span>(
    <span class="str">"SELECT SUM(e.salary) FROM Employee e"</span>, <span class="type">Double</span>.<span class="kw">class</span>)
    .<span class="fn">uniqueResult</span>();

<span class="cm">// MIN / MAX</span>
<span class="type">Double</span> maxSalary = session.<span class="fn">createQuery</span>(
    <span class="str">"SELECT MAX(e.salary) FROM Employee e"</span>, <span class="type">Double</span>.<span class="kw">class</span>)
    .<span class="fn">uniqueResult</span>();

<span class="cm">// GROUP BY + HAVING</span>
<span class="type">List</span>&lt;<span class="type">Object</span>[]&gt; grouped = session.<span class="fn">createQuery</span>(
    <span class="str">"SELECT e.department, COUNT(e), AVG(e.salary) "</span> +
    <span class="str">"FROM Employee e GROUP BY e.department HAVING COUNT(e) > 2"</span>,
    <span class="type">Object</span>[].<span class="kw">class</span>)
    .<span class="fn">getResultList</span>();

<span class="kw">for</span> (<span class="type">Object</span>[] row : grouped) {
    <span class="type">System</span>.out.<span class="fn">printf</span>(<span class="str">"Dept: %s, Count: %d, Avg: %.2f%n"</span>, row[<span class="num">0</span>], row[<span class="num">1</span>], row[<span class="num">2</span>]);
}</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ORDER BY + Subquery + UPDATE/DELETE -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">ORDER BY / Subquery / Bulk UPDATE-DELETE</span>
                            <span class="command-card-summary">เรียงลำดับ, Subquery, และ Bulk operations</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-query">Query</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="cm">// ORDER BY</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; sorted = session.<span class="fn">createQuery</span>(
    <span class="str">"FROM Employee e ORDER BY e.salary DESC, e.name ASC"</span>,
    <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">getResultList</span>();

<span class="cm">// Subquery</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; aboveAvg = session.<span class="fn">createQuery</span>(
    <span class="str">"FROM Employee e WHERE e.salary > "</span> +
    <span class="str">"(SELECT AVG(e2.salary) FROM Employee e2)"</span>,
    <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">getResultList</span>();

<span class="cm">// Bulk UPDATE (ไม่ผ่าน entity lifecycle)</span>
<span class="type">Transaction</span> tx = session.<span class="fn">beginTransaction</span>();
<span class="kw">int</span> updated = session.<span class="fn">createQuery</span>(
    <span class="str">"UPDATE Employee e SET e.salary = e.salary * 1.1 WHERE e.department = :dept"</span>)
    .<span class="fn">setParameter</span>(<span class="str">"dept"</span>, <span class="str">"IT"</span>)
    .<span class="fn">executeUpdate</span>();
<span class="type">System</span>.out.<span class="fn">println</span>(<span class="str">"Updated: "</span> + updated + <span class="str">" rows"</span>);

<span class="cm">// Bulk DELETE</span>
<span class="kw">int</span> deleted = session.<span class="fn">createQuery</span>(
    <span class="str">"DELETE FROM Employee e WHERE e.salary < :min"</span>)
    .<span class="fn">setParameter</span>(<span class="str">"min"</span>, <span class="num">20000.0</span>)
    .<span class="fn">executeUpdate</span>();

tx.<span class="fn">commit</span>();</code></pre>
                            </div>
                            <div class="info-box warning">
                                <span class="info-box-icon">⚠️</span>
                                <div>Bulk UPDATE/DELETE จะข้าม entity lifecycle callbacks และ cascade — session cache อาจ out of sync ควรเรียก <code>session.clear()</code> หลังจากทำ</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ============================================================ -->
            <!-- SECTION 6: CRITERIA API -->
            <!-- ============================================================ -->
            <section class="section" id="sec-criteria">
                <div class="section-header">
                    <div class="section-icon green">🔎</div>
                    <h2 class="section-title">Criteria API (JPA)</h2>
                </div>
                <p class="section-desc">Criteria API เป็น type-safe, programmatic way ในการสร้าง query — ลดข้อผิดพลาดจาก string-based HQL</p>

                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">CriteriaBuilder / CriteriaQuery</span>
                            <span class="command-card-summary">สร้าง type-safe query แบบ programmatic</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                            <span class="tag tag-important">แนะนำ</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="kw">import</span> javax.persistence.criteria.*;

<span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();

<span class="cm">// 1. สร้าง CriteriaBuilder</span>
<span class="type">CriteriaBuilder</span> cb = session.<span class="fn">getCriteriaBuilder</span>();

<span class="cm">// 2. สร้าง CriteriaQuery</span>
<span class="type">CriteriaQuery</span>&lt;<span class="type">Employee</span>&gt; cq = cb.<span class="fn">createQuery</span>(<span class="type">Employee</span>.<span class="kw">class</span>);

<span class="cm">// 3. กำหนด Root (FROM)</span>
<span class="type">Root</span>&lt;<span class="type">Employee</span>&gt; root = cq.<span class="fn">from</span>(<span class="type">Employee</span>.<span class="kw">class</span>);

<span class="cm">// 4. ดึงทั้งหมด</span>
cq.<span class="fn">select</span>(root);
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; all = session.<span class="fn">createQuery</span>(cq).<span class="fn">getResultList</span>();

<span class="cm">// ===== WHERE clause =====</span>
<span class="type">Predicate</span> salaryFilter = cb.<span class="fn">greaterThan</span>(root.<span class="fn">get</span>(<span class="str">"salary"</span>), <span class="num">50000.0</span>);
<span class="type">Predicate</span> nameFilter = cb.<span class="fn">like</span>(root.<span class="fn">get</span>(<span class="str">"name"</span>), <span class="str">"%สม%"</span>);

cq.<span class="fn">select</span>(root).<span class="fn">where</span>(cb.<span class="fn">and</span>(salaryFilter, nameFilter));
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; filtered = session.<span class="fn">createQuery</span>(cq).<span class="fn">getResultList</span>();

<span class="cm">// ===== ORDER BY =====</span>
cq.<span class="fn">orderBy</span>(cb.<span class="fn">desc</span>(root.<span class="fn">get</span>(<span class="str">"salary"</span>)));
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; sorted = session.<span class="fn">createQuery</span>(cq).<span class="fn">getResultList</span>();

<span class="cm">// ===== Aggregate =====</span>
<span class="type">CriteriaQuery</span>&lt;<span class="type">Long</span>&gt; countQuery = cb.<span class="fn">createQuery</span>(<span class="type">Long</span>.<span class="kw">class</span>);
<span class="type">Root</span>&lt;<span class="type">Employee</span>&gt; countRoot = countQuery.<span class="fn">from</span>(<span class="type">Employee</span>.<span class="kw">class</span>);
countQuery.<span class="fn">select</span>(cb.<span class="fn">count</span>(countRoot));
<span class="type">Long</span> totalCount = session.<span class="fn">createQuery</span>(countQuery).<span class="fn">uniqueResult</span>();

<span class="cm">// ===== IN clause =====</span>
<span class="type">CriteriaQuery</span>&lt;<span class="type">Employee</span>&gt; inQuery = cb.<span class="fn">createQuery</span>(<span class="type">Employee</span>.<span class="kw">class</span>);
<span class="type">Root</span>&lt;<span class="type">Employee</span>&gt; inRoot = inQuery.<span class="fn">from</span>(<span class="type">Employee</span>.<span class="kw">class</span>);
inQuery.<span class="fn">select</span>(inRoot)
    .<span class="fn">where</span>(inRoot.<span class="fn">get</span>(<span class="str">"department"</span>).<span class="fn">in</span>(<span class="str">"IT"</span>, <span class="str">"HR"</span>));
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; inResult = session.<span class="fn">createQuery</span>(inQuery).<span class="fn">getResultList</span>();

session.<span class="fn">close</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Predicate Methods -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">CriteriaBuilder Predicates</span>
                            <span class="command-card-summary">เมธอดทั้งหมดของ CriteriaBuilder</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="table-wrapper">
                                <table>
                                    <thead>
                                        <tr><th>Method</th><th>คำอธิบาย</th><th>SQL Equivalent</th></tr>
                                    </thead>
                                    <tbody>
                                        <tr><td><code>cb.equal()</code></td><td>เท่ากับ</td><td><code>= value</code></td></tr>
                                        <tr><td><code>cb.notEqual()</code></td><td>ไม่เท่ากับ</td><td><code>!= value</code></td></tr>
                                        <tr><td><code>cb.greaterThan()</code></td><td>มากกว่า</td><td><code>> value</code></td></tr>
                                        <tr><td><code>cb.greaterThanOrEqualTo()</code></td><td>มากกว่าหรือเท่ากับ</td><td><code>>= value</code></td></tr>
                                        <tr><td><code>cb.lessThan()</code></td><td>น้อยกว่า</td><td><code>< value</code></td></tr>
                                        <tr><td><code>cb.lessThanOrEqualTo()</code></td><td>น้อยกว่าหรือเท่ากับ</td><td><code><= value</code></td></tr>
                                        <tr><td><code>cb.like()</code></td><td>LIKE pattern</td><td><code>LIKE '%val%'</code></td></tr>
                                        <tr><td><code>cb.between()</code></td><td>ค่าอยู่ระหว่าง</td><td><code>BETWEEN a AND b</code></td></tr>
                                        <tr><td><code>cb.isNull()</code></td><td>เป็น null</td><td><code>IS NULL</code></td></tr>
                                        <tr><td><code>cb.isNotNull()</code></td><td>ไม่เป็น null</td><td><code>IS NOT NULL</code></td></tr>
                                        <tr><td><code>cb.and()</code></td><td>AND condition</td><td><code>AND</code></td></tr>
                                        <tr><td><code>cb.or()</code></td><td>OR condition</td><td><code>OR</code></td></tr>
                                        <tr><td><code>cb.not()</code></td><td>NOT condition</td><td><code>NOT</code></td></tr>
                                        <tr><td><code>cb.count()</code></td><td>นับจำนวน</td><td><code>COUNT()</code></td></tr>
                                        <tr><td><code>cb.sum()</code></td><td>ผลรวม</td><td><code>SUM()</code></td></tr>
                                        <tr><td><code>cb.avg()</code></td><td>ค่าเฉลี่ย</td><td><code>AVG()</code></td></tr>
                                        <tr><td><code>cb.max()</code></td><td>ค่ามากสุด</td><td><code>MAX()</code></td></tr>
                                        <tr><td><code>cb.min()</code></td><td>ค่าน้อยสุด</td><td><code>MIN()</code></td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ============================================================ -->
            <!-- SECTION 7: NATIVE SQL -->
            <!-- ============================================================ -->
            <section class="section" id="sec-native">
                <div class="section-header">
                    <div class="section-icon orange">🗃️</div>
                    <h2 class="section-title">Native SQL Queries</h2>
                </div>
                <p class="section-desc">เมื่อต้องใช้ SQL เฉพาะ database หรือ HQL ไม่รองรับ สามารถเขียน Native SQL ได้โดยตรง</p>

                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">session.createNativeQuery()</span>
                            <span class="command-card-summary">เขียน SQL ดิบตรงๆ</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-hibernate">Hibernate</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();

<span class="cm">// ดึงทั้ง entity</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; emps = session
    .<span class="fn">createNativeQuery</span>(<span class="str">"SELECT * FROM employees WHERE salary > :min"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">setParameter</span>(<span class="str">"min"</span>, <span class="num">50000</span>)
    .<span class="fn">getResultList</span>();

<span class="cm">// ดึงเป็น Object[] (ไม่ map entity)</span>
<span class="type">List</span>&lt;<span class="type">Object</span>[]&gt; rows = session
    .<span class="fn">createNativeQuery</span>(<span class="str">"SELECT full_name, salary FROM employees ORDER BY salary DESC"</span>)
    .<span class="fn">getResultList</span>();

<span class="kw">for</span> (<span class="type">Object</span>[] row : rows) {
    <span class="type">System</span>.out.<span class="fn">println</span>(row[<span class="num">0</span>] + <span class="str">" — "</span> + row[<span class="num">1</span>]);
}

<span class="cm">// Native UPDATE</span>
<span class="type">Transaction</span> tx = session.<span class="fn">beginTransaction</span>();
<span class="kw">int</span> affected = session
    .<span class="fn">createNativeQuery</span>(<span class="str">"UPDATE employees SET salary = salary * 1.05"</span>)
    .<span class="fn">executeUpdate</span>();
tx.<span class="fn">commit</span>();

session.<span class="fn">close</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ============================================================ -->
            <!-- SECTION 8: RELATIONSHIPS -->
            <!-- ============================================================ -->
            <section class="section" id="sec-relations">
                <div class="section-header">
                    <div class="section-icon blue">🔗</div>
                    <h2 class="section-title">Relationship Mapping</h2>
                </div>
                <p class="section-desc">Hibernate รองรับ 4 ประเภทความสัมพันธ์ระหว่าง entity — One-to-One, One-to-Many, Many-to-One, Many-to-Many</p>

                <!-- @OneToOne -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">@OneToOne</span>
                            <span class="command-card-summary">ความสัมพันธ์แบบ 1:1</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="ann">@Entity</span>
<span class="kw">public class</span> <span class="type">Employee</span> {
    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;
    <span class="kw">private</span> <span class="type">String</span> name;

    <span class="ann">@OneToOne</span>(cascade = <span class="type">CascadeType</span>.ALL, fetch = <span class="type">FetchType</span>.LAZY)
    <span class="ann">@JoinColumn</span>(name = <span class="str">"parking_spot_id"</span>, referencedColumnName = <span class="str">"id"</span>)
    <span class="kw">private</span> <span class="type">ParkingSpot</span> parkingSpot;
}

<span class="ann">@Entity</span>
<span class="kw">public class</span> <span class="type">ParkingSpot</span> {
    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;
    <span class="kw">private</span> <span class="type">String</span> spotNumber;

    <span class="ann">@OneToOne</span>(mappedBy = <span class="str">"parkingSpot"</span>)  <span class="cm">// Bidirectional</span>
    <span class="kw">private</span> <span class="type">Employee</span> employee;
}</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- @OneToMany / @ManyToOne -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">@OneToMany / @ManyToOne</span>
                            <span class="command-card-summary">ความสัมพันธ์แบบ 1:N</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                            <span class="tag tag-important">สำคัญ</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="ann">@Entity</span>
<span class="ann">@Table</span>(name = <span class="str">"departments"</span>)
<span class="kw">public class</span> <span class="type">Department</span> {
    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;
    <span class="kw">private</span> <span class="type">String</span> name;

    <span class="ann">@OneToMany</span>(
        mappedBy = <span class="str">"department"</span>,          <span class="cm">// ฝั่ง "many" เป็น owner</span>
        cascade = <span class="type">CascadeType</span>.ALL,
        orphanRemoval = <span class="kw">true</span>,              <span class="cm">// ลบ orphan entities</span>
        fetch = <span class="type">FetchType</span>.LAZY              <span class="cm">// ดึงเมื่อเรียก</span>
    )
    <span class="kw">private</span> <span class="type">List</span>&lt;<span class="type">Employee</span>&gt; employees = <span class="kw">new</span> <span class="type">ArrayList</span>&lt;&gt;();

    <span class="cm">// Helper methods</span>
    <span class="kw">public void</span> <span class="fn">addEmployee</span>(<span class="type">Employee</span> emp) {
        employees.<span class="fn">add</span>(emp);
        emp.<span class="fn">setDepartment</span>(<span class="kw">this</span>);
    }
    <span class="kw">public void</span> <span class="fn">removeEmployee</span>(<span class="type">Employee</span> emp) {
        employees.<span class="fn">remove</span>(emp);
        emp.<span class="fn">setDepartment</span>(<span class="kw">null</span>);
    }
}

<span class="ann">@Entity</span>
<span class="ann">@Table</span>(name = <span class="str">"employees"</span>)
<span class="kw">public class</span> <span class="type">Employee</span> {
    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;
    <span class="kw">private</span> <span class="type">String</span> name;

    <span class="ann">@ManyToOne</span>(fetch = <span class="type">FetchType</span>.LAZY)
    <span class="ann">@JoinColumn</span>(name = <span class="str">"department_id"</span>)  <span class="cm">// FK column</span>
    <span class="kw">private</span> <span class="type">Department</span> department;
}</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- @ManyToMany -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">@ManyToMany</span>
                            <span class="command-card-summary">ความสัมพันธ์แบบ N:M (ตารางกลาง)</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="ann">@Entity</span>
<span class="kw">public class</span> <span class="type">Student</span> {
    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;
    <span class="kw">private</span> <span class="type">String</span> name;

    <span class="ann">@ManyToMany</span>(cascade = {<span class="type">CascadeType</span>.PERSIST, <span class="type">CascadeType</span>.MERGE})
    <span class="ann">@JoinTable</span>(
        name = <span class="str">"student_course"</span>,             <span class="cm">// ชื่อตารางกลาง</span>
        joinColumns = <span class="ann">@JoinColumn</span>(name = <span class="str">"student_id"</span>),
        inverseJoinColumns = <span class="ann">@JoinColumn</span>(name = <span class="str">"course_id"</span>)
    )
    <span class="kw">private</span> <span class="type">Set</span>&lt;<span class="type">Course</span>&gt; courses = <span class="kw">new</span> <span class="type">HashSet</span>&lt;&gt;();
}

<span class="ann">@Entity</span>
<span class="kw">public class</span> <span class="type">Course</span> {
    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;
    <span class="kw">private</span> <span class="type">String</span> title;

    <span class="ann">@ManyToMany</span>(mappedBy = <span class="str">"courses"</span>)
    <span class="kw">private</span> <span class="type">Set</span>&lt;<span class="type">Student</span>&gt; students = <span class="kw">new</span> <span class="type">HashSet</span>&lt;&gt;();
}</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Cascade & Fetch -->
                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">CascadeType / FetchType</span>
                            <span class="command-card-summary">ควบคุม cascade operations และ loading strategy</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <h4>CascadeType:</h4>
                            <div class="table-wrapper">
                                <table>
                                    <thead>
                                        <tr><th>Type</th><th>คำอธิบาย</th></tr>
                                    </thead>
                                    <tbody>
                                        <tr><td><code>ALL</code></td><td>ทุก operation cascade ไปด้วย (persist, merge, remove, refresh, detach)</td></tr>
                                        <tr><td><code>PERSIST</code></td><td>cascade persist เท่านั้น</td></tr>
                                        <tr><td><code>MERGE</code></td><td>cascade merge เท่านั้น</td></tr>
                                        <tr><td><code>REMOVE</code></td><td>cascade remove เท่านั้น</td></tr>
                                        <tr><td><code>REFRESH</code></td><td>cascade refresh เท่านั้น</td></tr>
                                        <tr><td><code>DETACH</code></td><td>cascade detach เท่านั้น</td></tr>
                                    </tbody>
                                </table>
                            </div>
                            <h4>FetchType:</h4>
                            <div class="table-wrapper">
                                <table>
                                    <thead>
                                        <tr><th>Type</th><th>คำอธิบาย</th><th>Default</th></tr>
                                    </thead>
                                    <tbody>
                                        <tr><td><code>LAZY</code></td><td>โหลดเมื่อเรียกใช้ (proxy)</td><td>@OneToMany, @ManyToMany</td></tr>
                                        <tr><td><code>EAGER</code></td><td>โหลดทันทีพร้อม parent</td><td>@ManyToOne, @OneToOne</td></tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="info-box tip">
                                <span class="info-box-icon">💡</span>
                                <div>Best Practice: ใช้ <code>LAZY</code> เสมอ แล้วใช้ <code>JOIN FETCH</code> เมื่อต้องการข้อมูลจริงๆ — ป้องกัน N+1 problem</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ============================================================ -->
            <!-- SECTION 9: INHERITANCE -->
            <!-- ============================================================ -->
            <section class="section" id="sec-inheritance">
                <div class="section-header">
                    <div class="section-icon pink">📐</div>
                    <h2 class="section-title">Inheritance Mapping</h2>
                </div>
                <p class="section-desc">Hibernate รองรับ 3 กลยุทธ์ในการ map inheritance hierarchy ไปยัง database tables</p>

                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">@Inheritance Strategies</span>
                            <span class="command-card-summary">SINGLE_TABLE / JOINED / TABLE_PER_CLASS</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="cm">// ===== Strategy 1: SINGLE_TABLE (Default) =====</span>
<span class="cm">// ทุก subclass อยู่ในตารางเดียว, ใช้ discriminator column แยก</span>

<span class="ann">@Entity</span>
<span class="ann">@Inheritance</span>(strategy = <span class="type">InheritanceType</span>.SINGLE_TABLE)
<span class="ann">@DiscriminatorColumn</span>(name = <span class="str">"vehicle_type"</span>,
    discriminatorType = <span class="type">DiscriminatorType</span>.STRING)
<span class="kw">public abstract class</span> <span class="type">Vehicle</span> {
    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;
    <span class="kw">private</span> <span class="type">String</span> brand;
    <span class="kw">private</span> <span class="type">String</span> model;
}

<span class="ann">@Entity</span>
<span class="ann">@DiscriminatorValue</span>(<span class="str">"CAR"</span>)
<span class="kw">public class</span> <span class="type">Car</span> <span class="kw">extends</span> <span class="type">Vehicle</span> {
    <span class="kw">private</span> <span class="type">Integer</span> numberOfDoors;
}

<span class="ann">@Entity</span>
<span class="ann">@DiscriminatorValue</span>(<span class="str">"TRUCK"</span>)
<span class="kw">public class</span> <span class="type">Truck</span> <span class="kw">extends</span> <span class="type">Vehicle</span> {
    <span class="kw">private</span> <span class="type">Double</span> payloadCapacity;
}

<span class="cm">// ===== Strategy 2: JOINED =====</span>
<span class="cm">// แต่ละ class มีตารางแยก, JOIN ตอน query</span>

<span class="ann">@Entity</span>
<span class="ann">@Inheritance</span>(strategy = <span class="type">InheritanceType</span>.JOINED)
<span class="kw">public abstract class</span> <span class="type">Payment</span> {
    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;
    <span class="kw">private</span> <span class="type">Double</span> amount;
}

<span class="ann">@Entity</span>
<span class="kw">public class</span> <span class="type">CreditCardPayment</span> <span class="kw">extends</span> <span class="type">Payment</span> {
    <span class="kw">private</span> <span class="type">String</span> cardNumber;
}

<span class="ann">@Entity</span>
<span class="kw">public class</span> <span class="type">BankTransfer</span> <span class="kw">extends</span> <span class="type">Payment</span> {
    <span class="kw">private</span> <span class="type">String</span> bankAccount;
}

<span class="cm">// ===== Strategy 3: TABLE_PER_CLASS =====</span>
<span class="cm">// แต่ละ class มีตารางแยก, columns ซ้ำกัน</span>

<span class="ann">@Entity</span>
<span class="ann">@Inheritance</span>(strategy = <span class="type">InheritanceType</span>.TABLE_PER_CLASS)
<span class="kw">public abstract class</span> <span class="type">Shape</span> {
    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.AUTO)
    <span class="kw">private</span> <span class="type">Long</span> id;
    <span class="kw">private</span> <span class="type">String</span> color;
}</code></pre>
                            </div>
                            <div class="table-wrapper">
                                <table>
                                    <thead>
                                        <tr><th>Strategy</th><th>ข้อดี</th><th>ข้อเสีย</th></tr>
                                    </thead>
                                    <tbody>
                                        <tr><td><code>SINGLE_TABLE</code></td><td>เร็วที่สุด, ไม่ต้อง JOIN</td><td>columns เยอะ, มี NULL เยอะ</td></tr>
                                        <tr><td><code>JOINED</code></td><td>Normalized, ไม่มี NULL</td><td>ต้อง JOIN ทุกครั้ง</td></tr>
                                        <tr><td><code>TABLE_PER_CLASS</code></td><td>แต่ละ class เป็นอิสระ</td><td>UNION query ช้า, ไม่รองรับ IDENTITY</td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ============================================================ -->
            <!-- SECTION 10: CACHING -->
            <!-- ============================================================ -->
            <section class="section" id="sec-caching">
                <div class="section-header">
                    <div class="section-icon yellow">⚡</div>
                    <h2 class="section-title">Caching</h2>
                </div>
                <p class="section-desc">Hibernate มี caching 2 ระดับ: First-level cache (Session) และ Second-level cache (SessionFactory) เพื่อลดการ query DB</p>

                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">First-Level Cache (Session)</span>
                            <span class="command-card-summary">Cache อัตโนมัติใน Session — ปิดไม่ได้</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-hibernate">Hibernate</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();

<span class="cm">// ครั้งที่ 1 — SELECT จาก DB</span>
<span class="type">Employee</span> emp1 = session.<span class="fn">get</span>(<span class="type">Employee</span>.<span class="kw">class</span>, <span class="num">1L</span>);

<span class="cm">// ครั้งที่ 2 — ดึงจาก cache (ไม่ query DB)</span>
<span class="type">Employee</span> emp2 = session.<span class="fn">get</span>(<span class="type">Employee</span>.<span class="kw">class</span>, <span class="num">1L</span>);

<span class="type">System</span>.out.<span class="fn">println</span>(emp1 == emp2);  <span class="cm">// true (same object)</span>

<span class="cm">// evict — ลบออกจาก cache</span>
session.<span class="fn">evict</span>(emp1);
<span class="type">Employee</span> emp3 = session.<span class="fn">get</span>(<span class="type">Employee</span>.<span class="kw">class</span>, <span class="num">1L</span>);  <span class="cm">// query DB ใหม่</span>

<span class="cm">// clear — ล้าง cache ทั้งหมด</span>
session.<span class="fn">clear</span>();

session.<span class="fn">close</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">Second-Level Cache</span>
                            <span class="command-card-summary">Cache ระดับ SessionFactory — ใช้ร่วมกันทุก Session</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-hibernate">Hibernate</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">XML</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="cm">&lt;!-- ใน hibernate.cfg.xml --&gt;</span>
<span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.cache.use_second_level_cache"</span><span class="xml-tag">&gt;</span>true<span class="xml-tag">&lt;/property&gt;</span>
<span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.cache.region.factory_class"</span><span class="xml-tag">&gt;</span>
    org.hibernate.cache.jcache.JCacheRegionFactory
<span class="xml-tag">&lt;/property&gt;</span>
<span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.cache.use_query_cache"</span><span class="xml-tag">&gt;</span>true<span class="xml-tag">&lt;/property&gt;</span></code></pre>
                            </div>
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="kw">import</span> org.hibernate.annotations.Cache;
<span class="kw">import</span> org.hibernate.annotations.CacheConcurrencyStrategy;

<span class="ann">@Entity</span>
<span class="ann">@Cache</span>(usage = <span class="type">CacheConcurrencyStrategy</span>.READ_WRITE)
<span class="kw">public class</span> <span class="type">Employee</span> {
    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;
    <span class="kw">private</span> <span class="type">String</span> name;
}

<span class="cm">// Query Cache</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; employees = session
    .<span class="fn">createQuery</span>(<span class="str">"FROM Employee"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">setCacheable</span>(<span class="kw">true</span>)       <span class="cm">// เปิด query cache</span>
    .<span class="fn">getResultList</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ============================================================ -->
            <!-- SECTION 11: ENTITY LIFECYCLE -->
            <!-- ============================================================ -->
            <section class="section" id="sec-lifecycle">
                <div class="section-header">
                    <div class="section-icon red">🔄</div>
                    <h2 class="section-title">Entity Lifecycle Callbacks</h2>
                </div>
                <p class="section-desc">JPA Lifecycle callbacks ให้คุณรัน logic อัตโนมัติเมื่อ entity เปลี่ยน state — เช่น ตั้งค่า timestamp, validate data, audit logging</p>

                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">@PrePersist / @PostPersist / @PreUpdate / @PostUpdate / @PreRemove</span>
                            <span class="command-card-summary">Lifecycle event callbacks</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="ann">@Entity</span>
<span class="kw">public class</span> <span class="type">AuditableEntity</span> {

    <span class="ann">@Id</span>
    <span class="ann">@GeneratedValue</span>(strategy = <span class="type">GenerationType</span>.IDENTITY)
    <span class="kw">private</span> <span class="type">Long</span> id;

    <span class="kw">private</span> <span class="type">String</span> name;
    <span class="kw">private</span> <span class="type">LocalDateTime</span> createdAt;
    <span class="kw">private</span> <span class="type">LocalDateTime</span> updatedAt;

    <span class="ann">@PrePersist</span>
    <span class="kw">public void</span> <span class="fn">onPrePersist</span>() {
        <span class="kw">this</span>.createdAt = <span class="type">LocalDateTime</span>.<span class="fn">now</span>();
        <span class="kw">this</span>.updatedAt = <span class="type">LocalDateTime</span>.<span class="fn">now</span>();
        <span class="type">System</span>.out.<span class="fn">println</span>(<span class="str">"Before INSERT: "</span> + name);
    }

    <span class="ann">@PostPersist</span>
    <span class="kw">public void</span> <span class="fn">onPostPersist</span>() {
        <span class="type">System</span>.out.<span class="fn">println</span>(<span class="str">"After INSERT: ID = "</span> + id);
    }

    <span class="ann">@PreUpdate</span>
    <span class="kw">public void</span> <span class="fn">onPreUpdate</span>() {
        <span class="kw">this</span>.updatedAt = <span class="type">LocalDateTime</span>.<span class="fn">now</span>();
        <span class="type">System</span>.out.<span class="fn">println</span>(<span class="str">"Before UPDATE: "</span> + name);
    }

    <span class="ann">@PostUpdate</span>
    <span class="kw">public void</span> <span class="fn">onPostUpdate</span>() {
        <span class="type">System</span>.out.<span class="fn">println</span>(<span class="str">"After UPDATE: "</span> + name);
    }

    <span class="ann">@PreRemove</span>
    <span class="kw">public void</span> <span class="fn">onPreRemove</span>() {
        <span class="type">System</span>.out.<span class="fn">println</span>(<span class="str">"Before DELETE: "</span> + name);
    }

    <span class="ann">@PostRemove</span>
    <span class="kw">public void</span> <span class="fn">onPostRemove</span>() {
        <span class="type">System</span>.out.<span class="fn">println</span>(<span class="str">"After DELETE: "</span> + name);
    }

    <span class="ann">@PostLoad</span>
    <span class="kw">public void</span> <span class="fn">onPostLoad</span>() {
        <span class="type">System</span>.out.<span class="fn">println</span>(<span class="str">"Entity loaded: "</span> + name);
    }
}</code></pre>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ============================================================ -->
            <!-- SECTION 12: NAMED QUERIES -->
            <!-- ============================================================ -->
            <section class="section" id="sec-named">
                <div class="section-header">
                    <div class="section-icon purple">📌</div>
                    <h2 class="section-title">Named Queries</h2>
                </div>
                <p class="section-desc">Named Queries คือ pre-defined queries ที่ประกาศบน entity class — ช่วยให้ code อ่านง่ายและ Hibernate validate ตอน startup</p>

                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">@NamedQuery / @NamedNativeQuery</span>
                            <span class="command-card-summary">ประกาศ query ล่วงหน้าบน entity class</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-jpa">JPA</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="ann">@Entity</span>
<span class="ann">@NamedQueries</span>({
    <span class="ann">@NamedQuery</span>(
        name = <span class="str">"Employee.findAll"</span>,
        query = <span class="str">"SELECT e FROM Employee e ORDER BY e.name"</span>
    ),
    <span class="ann">@NamedQuery</span>(
        name = <span class="str">"Employee.findByDepartment"</span>,
        query = <span class="str">"SELECT e FROM Employee e WHERE e.department = :dept"</span>
    ),
    <span class="ann">@NamedQuery</span>(
        name = <span class="str">"Employee.findHighEarners"</span>,
        query = <span class="str">"SELECT e FROM Employee e WHERE e.salary > :minSalary"</span>
    )
})
<span class="ann">@NamedNativeQueries</span>({
    <span class="ann">@NamedNativeQuery</span>(
        name = <span class="str">"Employee.findAllNative"</span>,
        query = <span class="str">"SELECT * FROM employees"</span>,
        resultClass = <span class="type">Employee</span>.<span class="kw">class</span>
    )
})
<span class="kw">public class</span> <span class="type">Employee</span> {
    <span class="cm">// entity fields...</span>
}

<span class="cm">// เรียกใช้ Named Query</span>
<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; all = session
    .<span class="fn">createNamedQuery</span>(<span class="str">"Employee.findAll"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">getResultList</span>();

<span class="type">List</span>&lt;<span class="type">Employee</span>&gt; itTeam = session
    .<span class="fn">createNamedQuery</span>(<span class="str">"Employee.findByDepartment"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">setParameter</span>(<span class="str">"dept"</span>, <span class="str">"IT"</span>)
    .<span class="fn">getResultList</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ============================================================ -->
            <!-- SECTION 13: BATCH PROCESSING -->
            <!-- ============================================================ -->
            <section class="section" id="sec-batch">
                <div class="section-header">
                    <div class="section-icon green">📊</div>
                    <h2 class="section-title">Batch Processing</h2>
                </div>
                <p class="section-desc">เมื่อต้อง INSERT/UPDATE ข้อมูลจำนวนมาก ควรใช้ batch processing เพื่อป้องกัน OutOfMemoryError</p>

                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">Batch Insert / Update</span>
                            <span class="command-card-summary">ประมวลผลข้อมูลจำนวนมากอย่างมีประสิทธิภาพ</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-hibernate">Hibernate</span>
                            <span class="tag tag-important">สำคัญ</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">XML</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="cm">&lt;!-- ตั้งค่า batch size ใน hibernate.cfg.xml --&gt;</span>
<span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.jdbc.batch_size"</span><span class="xml-tag">&gt;</span>50<span class="xml-tag">&lt;/property&gt;</span>
<span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.order_inserts"</span><span class="xml-tag">&gt;</span>true<span class="xml-tag">&lt;/property&gt;</span>
<span class="xml-tag">&lt;property</span> <span class="xml-attr">name=</span><span class="xml-val">"hibernate.order_updates"</span><span class="xml-tag">&gt;</span>true<span class="xml-tag">&lt;/property&gt;</span></code></pre>
                            </div>
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();
<span class="type">Transaction</span> tx = session.<span class="fn">beginTransaction</span>();

<span class="kw">int</span> batchSize = <span class="num">50</span>;

<span class="kw">for</span> (<span class="kw">int</span> i = <span class="num">0</span>; i < <span class="num">10000</span>; i++) {
    <span class="type">Employee</span> emp = <span class="kw">new</span> <span class="type">Employee</span>();
    emp.<span class="fn">setName</span>(<span class="str">"Employee "</span> + i);
    emp.<span class="fn">setEmail</span>(<span class="str">"emp"</span> + i + <span class="str">"@example.com"</span>);
    emp.<span class="fn">setSalary</span>(<span class="num">30000.0</span> + (i * <span class="num">10</span>));

    session.<span class="fn">persist</span>(emp);

    <span class="kw">if</span> (i > <span class="num">0</span> && i % batchSize == <span class="num">0</span>) {
        <span class="cm">// flush — execute INSERT statements</span>
        session.<span class="fn">flush</span>();
        <span class="cm">// clear — ล้าง first-level cache ป้องกัน OOM</span>
        session.<span class="fn">clear</span>();
    }
}

tx.<span class="fn">commit</span>();
session.<span class="fn">close</span>();</code></pre>
                            </div>
                            <div class="info-box tip">
                                <span class="info-box-icon">💡</span>
                                <div>การใช้ <code>IDENTITY</code> generation strategy จะปิด batch insert — ใช้ <code>SEQUENCE</code> หรือ <code>TABLE</code> แทนเพื่อ batch ได้จริง</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="command-card">
                    <div class="command-card-header">
                        <div class="command-card-title-area">
                            <span class="command-card-name">ScrollableResults</span>
                            <span class="command-card-summary">อ่านข้อมูลจำนวนมากแบบ streaming</span>
                        </div>
                        <div class="command-card-tags">
                            <span class="tag tag-hibernate">Hibernate</span>
                        </div>
                        <span class="command-card-toggle">▼</span>
                    </div>
                    <div class="command-card-body">
                        <div class="command-card-content">
                            <div class="code-block">
                                <div class="code-block-header">
                                    <span class="code-block-lang">Java</span>
                                    <button class="code-block-copy">📋 Copy</button>
                                </div>
<pre><code><span class="type">Session</span> session = <span class="type">HibernateUtil</span>.<span class="fn">getSessionFactory</span>().<span class="fn">openSession</span>();
<span class="type">Transaction</span> tx = session.<span class="fn">beginTransaction</span>();

<span class="type">ScrollableResults</span> scroll = session
    .<span class="fn">createQuery</span>(<span class="str">"FROM Employee"</span>, <span class="type">Employee</span>.<span class="kw">class</span>)
    .<span class="fn">setCacheMode</span>(<span class="type">CacheMode</span>.IGNORE)
    .<span class="fn">scroll</span>(<span class="type">ScrollMode</span>.FORWARD_ONLY);

<span class="kw">int</span> count = <span class="num">0</span>;
<span class="kw">while</span> (scroll.<span class="fn">next</span>()) {
    <span class="type">Employee</span> emp = (<span class="type">Employee</span>) scroll.<span class="fn">get</span>();
    emp.<span class="fn">setSalary</span>(emp.<span class="fn">getSalary</span>() * <span class="num">1.1</span>);

    <span class="kw">if</span> (++count % <span class="num">50</span> == <span class="num">0</span>) {
        session.<span class="fn">flush</span>();
        session.<span class="fn">clear</span>();
    }
}

tx.<span class="fn">commit</span>();
session.<span class="fn">close</span>();</code></pre>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div><!-- .content-area -->

        <footer class="footer">
            <p>Hibernate ORM Command Reference &bull; Version 5.6.15.Final &bull; Java 11+</p>
            <p>Built with ❤️ for Java Developers &bull; <a href="https://hibernate.org/orm/documentation/" target="_blank">Official Documentation</a></p>
        </footer>
    </main>
</div>

<!-- Back to Top -->
<button class="back-to-top" id="backToTop" aria-label="Back to top">↑</button>

<script src="js/app.js"></script>
</body>
</html>
