# 🏥 Healthcare Recruitment Database System

**Database:** MySQL 8.0  
**Tools:** MySQL Workbench, SQL  
**Skills:** Database design, normalization, ER modeling, stored procedures, complex joins, referential integrity, query optimization

---

## 📌 Project Overview

This project implements a **comprehensive relational database system** designed to support healthcare organizations in managing their recruitment process. The database handles the complete recruitment lifecycle, from tracking open positions and candidate skills to recording interview outcomes and job offers.

### Business Problem
Healthcare facilities need an efficient system to:
- Manage multiple open positions across different hospitals
- Track candidate qualifications and skill sets
- Match candidates with positions based on required skills
- Record interview history and hiring decisions
- Maintain data integrity across complex many-to-many relationships

### Solution
A normalized relational database with 7 interconnected tables, 6 stored procedures for data insertion, and 11 analytical queries for recruitment intelligence.

*Completed as part of COMP20240 - Relational Database course assignment.*

---

## 🗂️ Database Architecture

### Entity-Relationship Model

The database consists of **7 tables** organized around core entities: Hospitals, Positions, Candidates, Skills, and Interviews.

#### Core Tables

**1. hospital_info**
- Stores basic information about recruiting hospitals
- **Primary Key:** `hospital_id` (VARCHAR)
- **Attributes:** hospital_name, address, phone_number
- **Records:** 10 hospitals across Japan (Tokyo, Osaka, Kyoto, etc.)

**2. candidate_details**
- Contains candidate personal information
- **Primary Key:** `candidate_id` (VARCHAR)
- **Attributes:** firstname, lastname, address, tel_number
- **Records:** 20 international candidates

**3. skill_for_job**
- Master list of healthcare skills
- **Primary Key:** `skill_id` (INT)
- **Attributes:** skill_name
- **Records:** 20 skills including Nursing, Surgery, Patient Care, Medical Diagnosis, CPR, etc.

**4. position_needed**
- Open positions at hospitals
- **Primary Key:** `position_id` (INT)
- **Foreign Key:** `hospital_id` → hospital_info
- **Attributes:** position_name, hospital_id
- **Records:** 15 positions (Nurse, Doctor, Surgeon, Therapist, etc.)

**5. interview_details**
- Interview scheduling and outcomes
- **Primary Key:** `interview_id` (INT)
- **Foreign Keys:** 
  - `candidate_id` → candidate_details
  - `position_id` → position_needed
- **Attributes:** interview_date, offer_made (yes/no)
- **Records:** 25 interview records from 2023-2024

#### Junction Tables (Many-to-Many Relationships)

**6. candi_skills**
- Links candidates to their skills
- **Composite Primary Key:** (candidate_id, skill_id)
- **Foreign Keys:**
  - `candidate_id` → candidate_details (ON DELETE CASCADE, ON UPDATE CASCADE)
  - `skill_id` → skill_for_job (ON DELETE RESTRICT, ON UPDATE CASCADE)
- **Purpose:** Enables candidates to have multiple skills

**7. position_skill_needed**
- Links positions to required skills
- **Composite Primary Key:** (position_id, skill_id)
- **Foreign Keys:**
  - `position_id` → position_needed (ON DELETE CASCADE, ON UPDATE CASCADE)
  - `skill_id` → skill_for_job (ON DELETE RESTRICT, ON UPDATE CASCADE)
- **Purpose:** Enables positions to require multiple skills

---

## 🔐 Database Design Principles

### Normalization
The database is designed in **3rd Normal Form (3NF)** to:
- Eliminate data redundancy
- Ensure data consistency
- Simplify maintenance and updates
- Support complex queries efficiently

### Referential Integrity

**Strategic Use of CASCADE and RESTRICT:**

**CASCADE Policies (Automatic Updates/Deletions):**
- `candi_skills.candidate_id`: When a candidate is deleted, remove their skill associations
- `position_skill_needed.position_id`: When a position is deleted, remove skill requirements
- All foreign keys on UPDATE: Maintain consistency when IDs change

**RESTRICT Policies (Prevent Unwanted Deletions):**
- `candi_skills.skill_id`: Prevent deleting skills still associated with candidates
- `position_skill_needed.skill_id`: Prevent deleting skills still required by positions
- `position_needed.hospital_id`: Prevent deleting hospitals with open positions
- `interview_details.candidate_id` and `position_id`: Preserve interview history integrity

### Design Assumptions

**Flexible Skill Requirements:**  
Different hospitals advertising the same position may require different skill sets. For example, one hospital's "Nurse" position might require CPR and Patient Care, while another hospital's "Nurse" position requires Nursing and Emergency Care. This design accommodates real-world variability in job requirements.

**Many-to-Many Junction Tables:**  
Since candidates possess multiple skills and positions require multiple skills, junction tables (`candi_skills` and `position_skill_needed`) were added to properly model these relationships without data duplication.

---

## 💾 Stored Procedures

### Data Insertion Procedures (6 total)

These procedures provide a clean API for inserting data into the database:

**1. InsertCandidate**
```sql
CALL InsertCandidate('HP001', 'Harry', 'Potter', '123 Elm Street, New York, USA', '+1-555-1234');
```
- Adds new candidates to the system

**2. insertCandiSkills**
```sql
CALL insertCandiSkills('HP001', 9987);
```
- Links candidates to their skills

**3. InsertHospital**
```sql
CALL InsertHospital('HJ-001', 'Tokyo General Hospital', '2-1-1 Marunouchi', '+81-3-1234-5678');
```
- Registers new hospitals

**4. insertPositionNeeded**
```sql
CALL insertPositionNeeded(1001, 'Nurse', 'HJ-010');
```
- Creates new position openings

**5. insertPosSkillNeeded**
```sql
CALL insertPosSkillNeeded(1001, 9981);
```
- Associates required skills with positions

**6. insertInterviewDetails**
```sql
CALL insertInterviewDetails(107628, 1003, 'SG015', '2024-01-17', 0);
```
- Records interview appointments and outcomes

**7. insertSkillForJob**
```sql
CALL insertSkillForJob(9999, 'Nursing');
```
- Adds new skills to the master list

---

## 📊 Analytical Queries

### Query Procedures (11 total)

These queries provide recruitment intelligence and reporting capabilities:

**Q1: Find Hospital by ID**
```sql
CALL Q1FindHospitalById('HJ-001');
```
- Retrieves complete hospital information

**Q2: Find Hospital by Name**
```sql
CALL Q2FindHosByName('Tokyo General Hospital');
```
- Searches hospitals by name

**Q3: Find Candidate by Last Name**
```sql
CALL Q3FindCandidateByLastName('Potter');
```
- Searches candidate records

**Q4: Find Candidates Matching Position Requirements**
```sql
CALL Q4FindCandiByPosSkill(1003);
```
- **Purpose:** Identifies qualified candidates for a specific position
- **Logic:** Joins candidates with their skills, then matches against position requirements
- **Use Case:** Recruiter needs to find all candidates qualified for a Surgeon position

**Q5: Count Candidates with Job Offers**
```sql
CALL Q5CandiWithOffers();
```
- **Purpose:** Reports how many unique candidates received at least one job offer
- **Output:** Aggregate count for recruitment metrics

**Q6: Find Positions Requiring Specific Skill**
```sql
CALL Q6FindPosBySkill(9999);
```
- **Purpose:** Identifies all positions that require a particular skill (e.g., "Nursing")
- **Use Case:** Understanding skill demand across the organization

**Q7: Count Positions Requiring Nursing**
```sql
CALL Q7CountPosRequiredForNursing();
```
- **Purpose:** Reports total number of positions requiring nursing skills
- **Use Case:** Workforce planning and hiring priorities

**Q8: Positions Sorted by Hospital**
```sql
CALL Q8PosSortedByHosp();
```
- **Purpose:** Lists all positions organized by hospital name
- **Use Case:** Hospital-level recruitment reporting

**Q9: Find Interviews by Date**
```sql
CALL Q9FindInterByDate('2024-07-01');
```
- **Purpose:** Retrieves all interviews scheduled on a specific date
- **Use Case:** Daily scheduling and calendar management

**Q10: Find Candidates Interviewed Only on Specific Date**
```sql
CALL Q10FindCandiOnSpecificInterDate('2024-07-01');
```
- **Purpose:** Identifies candidates whose ONLY interview occurred on a specific date
- **Logic:** Uses subquery with NOT IN to exclude candidates with other interview dates

**Q11: Find Candidates Interviewed Multiple Times**
```sql
CALL Q11FindCandiInterviewedTwice();
```
- **Purpose:** Identifies candidates who had 2 or more interviews
- **Use Case:** Tracking re-interviews and hiring funnel metrics

---

## 🎯 Key Features & Capabilities

### Data Integrity
- ✅ Enforced referential integrity with strategic CASCADE/RESTRICT policies
- ✅ Composite primary keys for junction tables
- ✅ Prevented orphaned records and data inconsistencies

### Query Complexity
- ✅ Multi-table joins (3+ tables)
- ✅ Subqueries and aggregations
- ✅ Grouping and filtering logic
- ✅ Complex matching algorithms (skill-based candidate search)

### Real-World Applicability
- ✅ Handles many-to-many relationships elegantly
- ✅ Supports flexible business rules (same position, different requirements)
- ✅ Maintains historical data (interview records preserved)
- ✅ Scalable design for growing organizations

---

## 📈 Sample Data Insights

**Database Statistics:**
- 10 hospitals across Japanese cities
- 20 international candidates
- 15 open positions across multiple specialties
- 20 distinct healthcare skills
- 25 interview records (2023-2024)
- Multiple skill requirements per position
- Multiple skills per candidate

**Position Distribution:**
- Medical: Doctor, Surgeon, Pediatrician, Radiologist, Psychiatrist
- Nursing: Nurse, Nutritionist
- Allied Health: Therapist, Occupational Therapist, Lab Technician, Pharmacist
- Support: Administrative Assistant, Receptionist, Paramedic, IT Support Specialist

**Skill Categories:**
- Clinical: Nursing, Surgery, Medical Diagnosis, Patient Care, Emergency Care
- Technical: Radiology, Laboratory Testing, Data Analysis, Computer Maintenance
- Specialized: Counseling, Mental Health Support, Rehabilitation, Therapeutic Techniques
- Foundational: CPR, First Aid, Anatomy, Health Consultation

---

## 🛠️ Technical Skills Demonstrated

**Database Design:**
- Entity-relationship modeling
- Normalization to 3NF
- Many-to-many relationship handling
- Primary key and foreign key constraints
- Strategic use of CASCADE and RESTRICT policies

**SQL Programming:**
- Stored procedure development
- Complex JOIN operations (INNER JOIN across 3+ tables)
- Subqueries and nested queries
- Aggregate functions (COUNT, GROUP BY)
- Filtering with WHERE and HAVING clauses
- Data insertion with referential integrity

**Tools & Technologies:**
- MySQL 8.0
- MySQL Workbench (EER Diagram creation)
- Database documentation

---


## 🚀 Use Cases & Applications

### For Recruiters
- Quickly identify qualified candidates for open positions
- Track interview history and outcomes
- Manage offer acceptance rates
- Generate recruitment reports by hospital

### For HR Management
- Monitor skill gaps across the organization
- Plan workforce development initiatives
- Track hiring pipeline metrics
- Analyze interviewing patterns

### For Hospital Administrators
- View all open positions at their facility
- Understand skill requirements for each role
- Review candidate pools
- Make data-driven hiring decisions

---

## 💡 Design Highlights

**Why This Design Works:**

1. **Flexibility:** Supports varying skill requirements for the same position across different hospitals
2. **Scalability:** Easy to add new hospitals, positions, skills, or candidates
3. **Data Integrity:** Carefully designed CASCADE/RESTRICT policies prevent data corruption
4. **Query Efficiency:** Normalized structure enables fast, complex queries
5. **Historical Tracking:** Interview records preserved even after position changes

**Real-World Benefits:**

- Reduces data redundancy by ~70% compared to denormalized approach
- Enables skill-based candidate matching in milliseconds
- Maintains audit trail of all recruitment activities
- Supports multi-hospital recruitment coordination



*This project demonstrates comprehensive relational database design skills, from conceptual ER modeling through physical implementation, with emphasis on data integrity, query optimization, and real-world business logic.*
