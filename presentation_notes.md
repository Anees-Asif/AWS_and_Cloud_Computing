**Question 1: What needs to be taken into account when doing a migration from on-prem to cloud? What steps will you need to make? Make a plan to be followed.**

When migrating from on-premises to the cloud, there are several crucial factors to consider. Here's a plan to follow:

1. **Assessment and Planning:**
   - Understand the current on-premises environment, including the database size (350GB+), its dependencies, and performance requirements.
   - Identify the business objectives and technical requirements for the migration.
   - Choose the appropriate Google Cloud region for hosting the database.
   - Estimate costs associated with GCP services.

2. **Database Migration Strategy:**
   - Select a migration strategy: Lift and Shift(move with minimal changes), Replatform( Make mods to to take advantage of cloud-native services while minimizing changes to the core functionality. ), or Refactor ( complete redesign to leverage cloud capabilites, leads to new arch.).
   - Decide if you will use a homogeneous (MySQL to MySQL) or heterogeneous (MySQL to a different database) migration approach.

3. **Data Migration:**
   - Choose a data transfer method: Offline (e.g., physical data transfer) or online (e.g., Google Cloud Database Migration Service).
   - Perform a test migration to ensure data integrity. Find any issues that may arise.

4. **Application Changes:**
   - Update application configurations to point to the new GCP-hosted database. This includes updating connection strings and credentials.
   - Test the application on GCP to identify and address any compatibility issues.

5. **Security and Compliance:**
   - Implement proper security measures, including firewall rules, identity and access management (IAM), and encryption.
   - Ensure compliance with industry regulations if applicable (e.g., GDPR, HIPAA).

6. **High Availability and Disaster Recovery:**
   - Configure high availability and failover mechanisms to ensure database availability.
   - Set up backup and disaster recovery procedures.

7. **Monitoring and Optimization:**
   - Implement monitoring tools like Google Cloud Monitoring.
   - Continuously monitor database performance and optimize as needed.

8. **Documentation and Training:**
   - Document the migration process and configurations. Valuable for troubleshooting.
   - Provide training to the operations team for managing the GCP-hosted database.

9. **Testing and Validation:**
   - Conduct thorough testing, including load testing and failover testing to ensure can handle expected traffic levels
   - Validate that the application is running smoothly on GCP and running as expected.

10. **Cutover and Post-Migration Support:**
    - Schedule a cutover window for the final migration.
    - Provide post-migration support to address any issues that may arise.

**Question 2: What options are there to do the migration? What services does GCP provide? Why use one over the other? Make sure to do proper research; there are multiple methods/services for each cloud provider. At least one slide to explain each method available.**

Google Cloud Platform offers several options for migrating an on-premises MySQL database:

1. **Google Cloud Database Migration Service:**
   - This fully managed service automates database migration.
   - Suitable for large databases like your 350GB+ MySQL database.
   - Provides minimal downtime and supports continuous replication for minimal data loss.
   - Automatic schema conversion and validation.
   - Use when you want a streamlined and hands-off migration process.

2. **Google Compute Engine (VM) with Database Replication:**
   - Create a Google Compute Engine VM and set up MySQL replication from the on-premises database.
   - Suitable for databases with specific customization requirements.
   - Provides control over the entire migration process.
   - Requires more manual setup but offers flexibility.

3. **Google Cloud Storage for Data Import/Export:**
   - Export data from the on-premises database to Google Cloud Storage using tools like `mysqldump`.
   - Import data from Google Cloud Storage into a GCP-hosted MySQL database.
   - Useful for smaller databases but may have higher downtime during migration.
   - Cost-effective for one-time migrations.

4. **Third-Party Tools:**
   - Consider using third-party migration tools that are compatible with GCP.
   - Some tools offer advanced features for data transformation and mapping.
   - Evaluate based on your specific migration requirements and budget.

**Recommendation:**
Considering the size of your MySQL database (350GB+), I recommend using **Google Cloud Database Migration Service** for its automation, minimal downtime, and data replication capabilities. This service will streamline the migration process and reduce the risk of data loss, making it the best choice for a large-scale migration.


## Conclusion

Sum up - We've introduced and talked about background of gcp and sql. plan and recommended a service and discussed the adv and disadv.  



I VS WE

Change arrows


Improve powerpoint coord

maybe dont need key information

change 6 boxes so its left to right 

use morph

more emphasis on decision and services.

GROUP:

Drawbacks and advantages of service chosen not GCP as a whole

ordering

swap around boldness last slide

