---
layout: workshop
venue: "University at Buffalo, SUNY (virtual)"   # brief name of host site without address (e.g., "Euphoric State University")
address: "University at Buffalo, SUNY, North Campus (virtual)"     # full street address of workshop (e.g., "Room A, 123 Forth Street, Blimingen, Euphoria")
country: "United States"      # lowercase two-letter ISO country code such as "fr" (see https://en.wikipedia.org/wiki/ISO_3166-1#Current_codes)
language: "en"     # lowercase two-letter ISO language code such as "fr" (see https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)
latitude: "43.002890"     # decimal latitude of workshop venue (use https://www.latlong.net/)
longitude: "-78.788780"    # decimal longitude of the workshop venue (use https://www.latlong.net)
humandate: "July 3-15, 2022"    # human-readable dates for the workshop (e.g., "Feb 17-18, 2020")
humantime: "9:00 am - 5:00 pm EDT"    # human-readable times for the workshop (e.g., "9:00 am - 4:30 pm")
startdate: 2022-07-03      # machine-readable start date for the workshop in YYYY-MM-DD format like 2015-01-01
enddate: 2022-07-15        # machine-readable end date for the workshop in YYYY-MM-DD format like 2015-01-02
instructor: ["Alexey Akimov", "Seung Kyu Min", "Peihong Zhang", "Sebastian Mai", "Davide Avagliano",
             "Luis Rego", "Lea-Maria Ibele", "Jin Zhao", "Dmitri Kilin", "Weibin Chu"]  # boxed, comma-separated list of instructors' names as strings, like ["Kay McNulty", "Betty Jennings", "Betty Snyder"]
helper: ["Mohammad Shakiba" ] # boxed, comma-separated list of helpers' names, like ["Marlyn Wescoff", "Fran Bilas", "Ruth Lichterman"]
email: ["alexeyak@buffalo.edu"]    # boxed, comma-separated list of contact email addresses for the host, lead instructor, or whoever else is handling questions, like ["marlyn.wescoff@example.org", "fran.bilas@example.org", "ruth.lichterman@example.org"]
collaborative_notes:         # optional: URL for the workshop collaborative notes, e.g. an Etherpad or Google Docs document (e.g., https://pad.carpentries.org/2015-01-01-euphoria)
googleform: https://forms.gle/kup1bkWibLsHH8Bn7
carpentry: "sc"
---


{% comment %}
root: .  # Is the only page that doesn't follow the pattern /:path/index.html
permalink: index.html  # Is the only page that doesn't follow the pattern /:path/index.html
{% endcomment %}


# Excited States and Nonadiabatic Dynamics CyberTraining Workshop 2022

## About the Summer School and Workshop

The CyberTraining workshop aims to educate graduate students, postdocs, researchers, and educators working in a 
broader field of nonadiabatic and excited-state dynamics as well as in computational material sciences in a variety
of tools and methods for such types of calculations. The workshop will provide conceptual and practical hands-on 
training in a range of methods and cyberinfrastructure (software and platforms) for modeling excited state and 
nonadiabatic dynamics in abstract models and atomistic materials. We will also cover tools and workflows for 
building atomistic models, computing excited states of molecular and periodic systems, as well as pre- and post-processing 
operations, and data analysis. 

Participants will not only learn about using the tools but will be exposed to the underlying machinery 
of such methods and will be familiarized with their development. The programming-driven nature of the school will
help the participants to go beyond the standard computational chemistry curriculum. The workshop will culminate with 
a capstone project presentation, through which the participants will demonstrate their ability to leverage the new tools 
in their active research. 

Keywords and topics:

- nonadiabatic dynamics
- excited states
- quantum dynamics
- quantum-classical methods
- charge transfer
- excitation energy transfer
- trajectory surface hopping
- TD-DFT
- algorithms and methods
- software, programming, Python
- best practices, git, github

 
The school aims to provide training in a range of advanced tools for excited state and 
nonadiabatic molecular dynamics calculations. 
This year, the focus will be on the following packages:

- pyUNIxMD (Min)
- CT-MQC (Ibele)
- SHARC (Mai, Avagliano)
- OpenMolcas (Mai, Avagliano)
- Hefei-NAMD (Zhao, Chu)
- Quantum Espresso (Zhao, Chu)
- BerkeleyGW (Zhang)
- DynEMol  (Rego)
- Libra (Akimov)
- DFTB+ (Shakiba)
- CP2K (Shakiba)
- TBD (Kilin)

The school will leverage the [OnDemand](https://ondemand.ccr.buffalo.edu) gateway at the University at Buffalo


## Logistics

{% if page.humandate %}
<p id="when">
  <strong>When:</strong>
  {{page.humandate}}.
  {% include workshop_calendar.html %}
</p>
{% endif %}

{% if page.latitude and page.longitude %}
<p id="where">
  <strong>Where:</strong>
  {{page.address}}.
  Get directions with
  <a href="//www.openstreetmap.org/?mlat={{page.latitude}}&mlon={{page.longitude}}&zoom=16">OpenStreetMap</a>
  or
  <a href="//maps.google.com/maps?q={{page.latitude}},{{page.longitude}}">Google Maps</a>.
</p>
{% endif %}

{% comment %}
CONTACT EMAIL ADDRESS
Display the contact email address set in the configuration file.
{% endcomment %}
<p id="contact">
  <strong>Contact</strong>:
  Please email
  {% if page.email %}
  {% for email in page.email %}
  {% if forloop.last and page.email.size > 1 %}
  or
  {% else %}
  {% unless forloop.first %}
  ,
  {% endunless %}
  {% endif %}
  <a href='mailto:{{email}}'>{{email}}</a>
  {% endfor %}
  {% else %}
  to-be-announced
  {% endif %}
  for more information.
</p>

### Schedule

{% include base_path.html %}

The details may vary and the order of topics may be changed, the topics may be omitted or added. Please check for the updates. 

  <table class="table table-striped">
  
  <tr>
    <td class="col-md-3"><strong>Date</strong></td>
    <td class="col-md-7"><strong>Topics</strong></td> 
    <td class="col-md-2"><strong>Instructors</strong></td>
  </tr>
  
  <tr>
    <td class="col-md-3">June 14, 2021 (Day 1), <strong>Monday</strong></td>
    <td class="col-md-7">
      <ul>        
        <li><a href="/_episodes/01-introduction.html">Introduction. Overview of CyberInfrastructure. </a></li>
        <li><a href="/_episodes/02-python-git.html">Revision of Python and Best Practices.</a> </li>
        <li><a href="/_episodes/02-python-git.html">Coding Molecular Dynamics. Intro to Libra.</a></li>
      </ul>
    </td> 
    <td class="col-md-2">Alexey Akimov, Jeanette Sperhac, Sudhakar Pamidighantam</td>
  </tr>

  <tr>
    <td class="col-md-3">June 15, 2021 (Day 2), Tuesday</td>
    <td class="col-md-7">
      <ul>
        <li><a href="/_episodes/03-nano-qmflows">nano-qmflows workflows</a> </li>
        <li><a href="/_episodes/04-md-libra">Overview of the Libra code. Model Hamiltonians in Libra</a></li>
      </ul>
    </td>
    <td class="col-md-2">Ivan Infante, Felipe Zapata, Alexey Akimov</td>
  </tr>

  <tr>
    <td class="col-md-3">June 16, 2021 (Day 3), Wednesday</td>
    <td class="col-md-7">
      <ul>
        <li><a href="/_episodes/05-heom-libra">Hierarchy of equations of motion (HEOM) calculations with Libra. </a></li>
        <li><a href="/_episodes/06-tsh-dvr-libra">Wavepacket/DVR calculations with  Libra. </a></li>
      </ul>
    </td>
    <td class="col-md-2">Amber Jain, Alexey Akimov</td>
  </tr>

  <tr>
    <td class="col-md-3">June 17, 2021 (Day 4), Thursday</td>
    <td class="col-md-7">
      <ul>
        <li><a href="/_episodes/07-cat-fox">Building quantum dot structures with FOX and CAT</a></li>
        <li><a href="/_episodes/08-nbra-workflows-libra">Atomistic simulations of NA-MD in materials, using Libra/DFTB+, Libra/cp2k, Libra/ErgoSCF, Libra/QE interfaces</a></li>
      </ul>
    </td>
    <td class="col-md-2">Ivan Infante, Felipe Zapata, Alexey Akimov</td>
  </tr>

  <tr>
    <td class="col-md-3">June 18, 2021 (Day 5), Friday</td>
    <td class="col-md-7">
      <ul>
        <li><a href="/_episodes/09-nexmd">Excited state dynamics of extended organic systems using NEXMD</a></li>
      </ul>
    </td>
    <td class="col-md-2">Sergei Tretiak, Walter Malone</td>
  </tr>
  
  <tr>
    <td class="col-md-3">June 19, 2021 (Day 6), Saturday</td>
    <td class="col-md-7">On your own. Projects time</td>
    <td class="col-md-2"></td>
  </tr>

  <tr>
    <td class="col-md-3">June 20, 2021 (Day 7), Sunday</td>
    <td class="col-md-7">On your own. Projects time</td>
    <td class="col-md-2"></td>
  </tr>

  <tr>
    <td class="col-md-3">June 21, 2021 (Day 8), <strong>Monday</strong></td>
    <td class="col-md-7">
      <ul>
        <li><a href="/_episodes/10-qxmd">Excited state dynamics of extended inorganic systems using QXMD</a></li>
      </ul>
    </td>
    <td class="col-md-2">Aiichiro Nakano, Tom Linker, Alexey Akimov</td>
  </tr>

  <tr>
    <td class="col-md-3">June 22, 2021 (Day 9), Tuesday</td>
    <td class="col-md-7">
      <ul>
        <li><a href="/_episodes/11-columbus">Accurate excited state calculations using COLUMBUS package</a></li>
      </ul>
    </td>
    <td class="col-md-2">Hans Lischka, Alexey Akimov</td>
  </tr>

  <tr>
    <td class="col-md-3">June 23, 2021 (Day 10), Wednesday</td>
    <td class="col-md-7">
      <ul>
        <li><a href="/_episodes/12-newtonx">Nonadiabatic dynamics using Newton-X/DFTB+ package</a></li>
        <li><a href="/_episodes/11-columbus">Accurate excited state calculations using COLUMBUS package</a></li>
      </ul>
    </td>
    <td class="col-md-2">Mario Barbatti, Ljiljana Stojanovic, Hans Lischka</td>
  </tr>

  <tr>
    <td class="col-md-3">June 24, 2021 (Day 11), Thursday</td>
    <td class="col-md-7">
      <ul>
        <li><a href="/_episodes/12-newtonx">Nonadiabatic dynamics using Newton-X/COLUMBUS package</a></li>        
      </ul>
    </td>
    <td class="col-md-2">Mario Barbatti, Hans Lischka</td>
  </tr>

  <tr>
    <td class="col-md-3">June 25, 2021 (Day 12), Friday</td>
    <td class="col-md-7">
      <ul>
        <li><a href="/_episodes/13-projects">Students projects presentations</a></li>
        <li>Awards and Closing</li>
      </ul>
    </td>
    <td class="col-md-2"></td>
  </tr>
  
  </table>


## Our team
### Our instructors

| Name            | Affiliation         |    Role/Software covered   |
| --------------- | ------------------- | -------------------------- |
| [Dr. Alexey Akimov](https://akimovlab.github.io/)         |   University at Buffalo, USA      | Workshop coordinator, Instructor for: **Libra, DFTB+, ErgoSCF, CP2k, QXMD, etc.** |
| [Ms. Jeanette Sperhac](http://www.buffalo.edu/ccr/about-us/people/staff/sperhac.html)      |   University at Buffalo Center for Computational Research, USA  | Workshop coordinator, Instructor for: **Jupyter, Open OnDemand, UB CCR HPC** |
| [Dr. Sudhakar Pamidighantam](https://www.chem.indiana.edu/faculty/sudhakar-pamidighantam/)  | Indiana University, USA  | Instructor for: **SEAGrid platform** |
| [Dr. Sergei Tretiak](https://cnls.lanl.gov/~serg/homepage.html) | Los Alamos National Laboratory, USA | Instructor for: **NEXMD** |
| [Dr. Walter Malone](https://cnls.lanl.gov/External/people/Walter_Malone.php) | Los Alamos National Laboratory, USA | Instructor for: **NEXMD** |
| [Dr. Ivan Infante](https://iinfant76.wixsite.com/infantelab) | Istituto Italiano di Tecnologia, Italy | Instructor for: **CAT, FOX, nano-qmflows, CP2k** |
| [Dr. Felipe Zapata](https://www.linkedin.com/in/felipe-zapata/?originalSubdomain=nl) | Netherlands eScience Center, Netherlands | Instructor for: **CAT, FOX, nano-qmflows, CP2k** |
| [Dr. Hans Lischka](https://homepage.univie.ac.at/hans.lischka/) | Texas Tech University | Instructor for: **COLUMBUS, Newton-X** |
| [Dr. Mario Barbatti](https://barbatti.org/) | Aix-Marseille University, France | Instructor for: **Newton-X, DFTB+** |
| [Dr. Ljiljana Stojanovic](https://iris.ucl.ac.uk/iris/browse/profile?upi=LSTOJ81) | University College London, UK | Instructor for **Newton-X, DFTB+** |
| [Dr. Amber Jain](https://amberj74.wixsite.com/quantumdynamics/amber-jain-1) | Indian Institute of Technology, India  | Instructor: **HEOM (in Libra)** |
| [Dr. Aiichiro Nakano](https://viterbi.usc.edu/directory/faculty/Nakano/Aiichiro) | University of Southern California, USA  |  Instructor for: **QXMD** |

### Our co-instructors/helpers

| Name            | Affiliation         |    Role/Software covered   |
| --------------- | ------------------- | -------------------------- |
| Mr. Mohammad Shakiba   |  Shahid Bahonar University of Kerman, Iran   | Co-instructor for: **CP2k, Libra/CP2k** |
| Mr. Bas van Been  |  Vrije Universiteit Amsterdam, The Netherlands  | Co-instructor for: **CAT, FOX, nano-qmflows** |
| Ms. Juliette Zito  |  Istituto Italiano di Tecnologia, Italy  | Co-instructor for: **CAT, FOX, nano-qmflows** |
| Ms. Roberta Pascazio | Istituto Italiano di Tecnologia, Italy | Co-instructor for **CAT, FOX** | 
| Dr. Reed Nieman | Texas Tech University, USA | Co-instructor for **COLUMBUS** |
| Mr. Thomas Linker | University of Southern California, USA  |  Co-instructor for: **QXMD** |


### The UB Center for Computational Research team

| Name            |   Role/Software covered    |
| --------------- | -------------------------- |
| [Ms. Dori Sajdak](http://www.buffalo.edu/ccr/about-us/people/staff/sajdak.html) | UB CCR system administrator, UB VPN, Open OnDemand, HPC accounts, etc. |
| [Ms. Cynthia Cornelius](http://www.buffalo.edu/ccr/about-us/people/staff/cornelius.html) | UB CCR system administrator, program installation, environment configurations, etc. |
 



## Participation
### How to apply to the school

1. Read this page carefully
2. Prepare your application package (you will need it in the next steps)

   2.1. your CV (including graduate or undergraduate GPA)

   2.2. a statement of purpose PDF should describe in no more than 2 pages:

   * your current/ongoing research projects and interests; 
   * how you plan to use the CyberTraining skill gained in this workshop in your research, for instance if you expect using any of the
     packages that will be covered at this workshop (see the agenda);
   * propose at least one potential project to be completed during the summer school; the project will be presented at the end of the 
     event and should involving one or more tools/software covered during the workshop (see the agenda). The quality and feasibility 
     of the proposed workshop projects will be considered during the selection of the participants. 
         
   2.3. request your advisor to submit a letter of recommendation for you to the following email: "alexeyak AT buffalo DOT edu", 
   please replace "AT" and "DOT" with the corresponding characters

3. Complete the <a href="https://forms.gle/kup1bkWibLsHH8Bn7" target="_blank" rel="nofollow">**Registration form**</a>


### Important dates
   * Workshop application materials are due 5 pm EDT, June 7, 2020
   * Students and Postdocs will be notified of their admission by June 10, 2020
   * Workshop starts: 11 am EDT, June 14, 2021
   * Workshop ends: 5 pm EDT, June 26, 2021


### Who can apply

This summer school is primarily for graduate students working in computational 
modeling of excited states and nonadiabatic dynamics, both in abstract and atomistic
applications/problems. The school aims to help researchers/students working either in 
methodology development for nonadiabatic or quantum-classical dynamics and in 
applied studies of various types of solar energy materials (photovoltaics, photocatalytics, etc.). 

Postdocs and researchers wishing to acquire the practical experience with new simulation
tools and expand their knowledge in the areas of excited states and nonadiabatic dynamics
are also welcomed to participate.




### Selection and restrictions

* **Competitive selection** The applicants will be selected based on the strength of their statement of purpose, as well as the adequate 
  support of their supervisors and their level of fundamental preparation. The lack of training in specialized methods and software is not a problem. 
  What is more important is how ready the applicants are to absorb the new knowlege, how efficiently they can operate during the workshop, 
  and how critical the use of the methods/tools covered in the workshop may be for your future research or career (e.g. educating others). 

* **The VPN cap/instructing efficiency limit.** The hands-on session will be facilitated by the CyberInfrastructure built
  at the UB CCR cluster. As such, users have to use VPN to remotely access the cluster. The UBIT department has provided 
  a block of 30 external VPNs for non-UB participants (including about 10 instructors). This number sets the limit of about 
  20 people for non-instructor participants we can accept to the fully-fledged (talks/demos + hands-on) event. However, more 
  participants may be admitted to the theory talks/demo sessions. 

* **Export control limit.** Certain countries (e.g. China, Iran, Russia, etc.) can not be issued the UB VPN, so the participants 
  from these countries can not use the UB CCR cyberinftrastructure during the hands-on activities. Such participants may still be 
  admitted to the theory talks/demo sessions. In your application, please indicate if you would like to participate without access 
  of UB CCR facilities. In this case, you may need to rely on your own installations or may simply  be here for the theory talks and 
  demos.

* **Group champions.** We anticipate the workshop may be of interest to more than 1 person from any given research group. To broaden 
  and diversify the participation, we will admit only 1 person from any research group (2, if we have room) to a fully-fledged workshop
  (talks/demos + hands-on). This is the group champion. Although this person will not be allowed to share their login credentials with other
  group members, they are free to communicate with other group members (that may be accepted to the workshop as non-champions) during hands-on
  exercises and share their screens with the group mates. In your application, please indicate whether you are selected by the group as the
  group champion. If you are not assigned to be the group champion, but still want to participate in the event (either relying on your own installations,
  or working with your group champion, or just staying for the theory talks/demos), please indicate this in your application. 





### Acknowledgement

This workshop is made possible by the NSF-OAC CyberTraining program. Thank you!



{% include links.md %}
