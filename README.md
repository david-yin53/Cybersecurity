## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](~/Documents/UT\ Cyber\ BC/Cybersecurity/Diagrams/Network\ Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - ![ELK Stack Deployment](~/Documents/UT\ Cyber\ BC/Cybersecurity/Ansible)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system metrics.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name                 | Function   | IP Address     | Operating System |
|----------------------|------------|----------------|------------------|
| Jump-Box-Provisioner | Gateway    | 65.52.126.213  | Linux Ubuntu     |
| Web 1                | Web server | 40.83.216.21   | Linux Ubuntu     |
| Web 2                | Web server | 40.83.216.21   | Linux Ubuntu     |
| ELK-Stack            | ELK server | 104.43.205.231 | Linux Ubuntu     |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner and ELK-Stack machines can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 108.222.90.18

Machines within the network can only be accessed by:
- Jump-Box-Provisioner

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Address |
|----------------------|---------------------|--------------------|
| Jump-Box-Provisioner | Yes                 | 108.222.90.18      |
| Web 1                | No                  |                    |
| Web 2                | No                  |                    |
| ELK-Stack            | Yes                 | 108.222.90.18      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- It ensures that our provisioning scripts run identically everywhere we use them.

The playbook implements the following tasks:
- Installs docker.io, python3-pip, Docker module
- Increases virtual memory and directs sysctl to use the added memory
- Downloads and launches the ELK container and makes sure the container is running on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![ELK Container Displayed](~/Documents/UT\ Cyber\ BC/Cybersecurity/Images/ELK\ Installation-\ ELK\ Container\ Screenshot.jpg)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web 1 & Web 2

We have installed the following Beats on these machines:
- Web 1 & Web 2: Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat: collects data about the file system. Generates and oranizes log files
- Metricbeat: collects machine metrics, such as uptime and performance

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the main.yml file, hosts file, and roles directory to /etc/ansible.
- Update the files to include your IP addresses in the filebeat and metricbeat config files and valid file paths 
- Update the ansible hosts file to add the needed VM's to the proper groups
- Run the playbook, and navigate to http://(ELK-VM-IP-Address):5601/app/kibana to check that the installation worked as expected
