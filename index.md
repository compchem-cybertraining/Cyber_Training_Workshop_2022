---
layout: workshop
venue: "University at Buffalo, SUNY"   # brief name of host site without address (e.g., "Euphoric State University")
address: "University at Buffalo, SUNY, North Campus"     # full street address of workshop (e.g., "Room A, 123 Forth Street, Blimingen, Euphoria")
country: "United States"      # lowercase two-letter ISO country code such as "fr" (see https://en.wikipedia.org/wiki/ISO_3166-1#Current_codes)
language: "en"     # lowercase two-letter ISO language code such as "fr" (see https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)
latitude: "43.002890"     # decimal latitude of workshop venue (use https://www.latlong.net/)
longitude: "-78.788780"    # decimal longitude of the workshop venue (use https://www.latlong.net)
humandate: "July 3-15, 2022"    # human-readable dates for the workshop (e.g., "Feb 17-18, 2020")
humantime: "9:00 am - 5:00 pm EDT"    # human-readable times for the workshop (e.g., "9:00 am - 4:30 pm")
startdate: 2022-07-03      # machine-readable start date for the workshop in YYYY-MM-DD format like 2015-01-01
enddate: 2022-07-15        # machine-readable end date for the workshop in YYYY-MM-DD format like 2015-01-02
instructor: ["Alexey Akimov", "Seung Kyu Min", "Peihong Zhang", "Sebastian Mai", "Davide Avagliano",
             "Luis Rego", "Lea-Maria Ibele", "Jin Zhao", "Weibin Chu", "Qijing Zheng", "Dmitri Kilin" ]  # boxed, comma-separated list of instructors' names as strings, like ["Kay McNulty", "Betty Jennings", "Betty Snyder"]
helper: ["Mohammad Shakiba", "Dae Ho Han", "Matthew Dutra" ] # boxed, comma-separated list of helpers' names, like ["Marlyn Wescoff", "Fran Bilas", "Ruth Lichterman"]
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

Participants not only will learn about using the tools but will be exposed to the underlying machinery 
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
- coupled trajectories
- exact factorization
- TD-DFT, CASSCF, GW/BSE
- algorithms and methods
- software, programming, Python
- best practices, Git, GitHub

 
The school aims to provide training in a range of advanced tools for excited state and 
nonadiabatic molecular dynamics calculations. 
This year, the focus will be on the following packages:

- pyUNIxMD (Min)
- CT-MQC (Ibele)
- SHARC (Mai)
- SHARC/COBRAMM (Avagliano)
- OpenMolcas (Mai, Avagliano)
- ORCA (Mai)
- Hefei-NAMD (Zhao, Chu)
- Quantum Espresso (Zhao, Chu)
- BerkeleyGW and paratec (Zhang)
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
    <td class="col-md-3">July 3, 2022 (Day 1), Sunday</td>
    <td class="col-md-7">
      <ul>        
        <li>Arrivals</li>
        <li>Welcome dinner</li>
      </ul>
    </td> 
    <td class="col-md-7">None</td>
  </tr>

  
  <tr>
    <td class="col-md-3">July 4, 2022 (Day 2), <strong>Monday</strong></td>
    <td class="col-md-7">
      <ul>
        <strong>Morning, 9 am - noon</strong>        
        <li><a href="/_episodes/01-introduction">Introduction. Overview of the CCR CyberInfrastructure and auxiliary Software (30 min)</a></li>
        <li><a href="/_episodes/02-python-git">Working with Git and GitHub. Python/Jupyter. Best practices. Theory and Hands on (90 min)</a> </li>
        <li><a href="/_episodes/03-libra">General overview of Libra. Demos on various auxiliary capabilities and simple hands ons (60 min)</a></li>
        <strong>Noon - 1:30 pm</strong> Lunch break
        <strong>Afternoon, 1:30 pm - 5:00 pm</strong>
        <li><a href="/_episodes/03-libra">Quantum Trajectories with Adaptive Gaussians (QTAG). Lecture (30 min)</a></li>
        <li><a href="/_episodes/03-libra">Quantum Trajectories with Adaptive Gaussians (QTAG). Demo and Hands on (30 min)</a></li>
        <li><a href="/_episodes/03-libra">Machine learning capabilities of Libra: Lecture, Demo, and Hands on  (60 min)</a></li>
        <li><a href="/_episodes/03-libra">HEOM and DVR in Libra. Lecture, Demo, and Hands on (90 min)</a></li>
      </ul>
    </td> 
    <td class="col-md-2">Alexey Akimov, Matthew Dutra</td>
  </tr>

  <tr>
    <td class="col-md-3">July 5, 2022 (Day 3), Tuesday</td>
    <td class="col-md-7">
      <ul>
        <strong>Morning, 9 am - noon</strong>        
        <li><a href="/_episodes/03-libra">Theory of adiabatic and nonadiabatic dynamics. Lecture (60 min)</a></li>
        <li><a href="/_episodes/03-libra">TSH and Ehrenfest dynamics with model Hamiltonians in Libra. Hands on (90 min)</a></li>
        <li><a href="/_episodes/03-libra">NA-MD with ML in Libra. Theory. Hands on (30 min)</a></li>
        <strong>Noon - 1:30 pm</strong> Lunch break
        <strong>Afternoon, 1:30 pm - 5:00 pm</strong>
        <li><a href="/_episodes/03-libra">NA-MD in finite and condensed matter systems with xTB and TD-DFT with Libra/CP2k code.</a></li>
        <li><a href="/_episodes/03-libra">NA-MD calculations in condensed matter systems with Libra/QE/eQE codes.</a></li>
      </ul>
    </td>
    <td class="col-md-2">Alexey Akimov, Mohammad Shakiba</td>
  </tr>

  <tr>
    <td class="col-md-3">July 6, 2022 (Day 4), Wednesday</td>
    <td class="col-md-7">
      <ul>
        <strong>Morning, 9 am - noon</strong>        
        <li><a href="/_episodes/08-dynemol">MM and non-adiabatic trajectory methods (Ehrenfest, FSSH, CSDM). Theory (90 min)</a></li>
        <li><a href="/_episodes/08-dynemol">DynEMol code. Hands on (90 min)</a></li>
        <strong>Noon - 1:30 pm</strong> Lunch break
        <strong>Afternoon, 1:30 pm - 5:00 pm</strong>
        <li><a href="/_episodes/08-dynemol">DynEMol Q and A and students projects (60 min)</a></li>
        <li><a href="/_episodes/07-cobramm">QM/MM for excited states. Theory (75 min)</a></li>
        <li><a href="/_episodes/07-cobramm">COBRAMM/Amber. Hands on (75 min)</a></li>
      </ul>
    </td>
    <td class="col-md-2">Luis Rego, Davide Avagliano</td>
  </tr>

  <tr>
    <td class="col-md-3">July 7, 2022 (Day 5), Thursday</td>
    <td class="col-md-7">
      <ul>
        <strong>Morning, 9 am - noon</strong>        
        <li><a href="/_episodes/07-cobramm">COBRAMM/Amber. Hands on (60 min)</a></li>
        <li><a href="/_episodes/04-molcas">Excited states calculations with CASSCF. Theory (60 min)</a></li>
        <li><a href="/_episodes/04-molcas">CASSCF with OpenMolcas. Hands on (60 min)</a></li>
        <strong>Noon - 1:30 pm</strong> Lunch break
        <strong>Afternoon, 1:30 pm - 5:00 pm</strong>
        <li><a href="/_episodes/06-sharc">From FSSH to SHARC, practical aspects. Theory (60 min)</a></li>
        <li><a href="/_episodes/06-sharc">SHARC with CASSCF. Hands on (90 min)</a></li>
      </ul>
    </td>
    <td class="col-md-2">Sebastian Mai, Davide Avagliano</td>
  </tr>

  <tr>
    <td class="col-md-3">July 8, 2022 (Day 6), Friday</td>
    <td class="col-md-7">
      <ul>
        <strong>Morning, 9 am - noon</strong>        
        <li><a href="/_episodes/05-orca">Excited states with TDDFT (in ORCA) and LVC model potentials. Theory (60 min)</a></li>
        <li><a href="/_episodes/06-sharc">SHARC with LVC: Preparing parameters from TDDFT and running a swarm of LVC trajectories. Hands on (120 min)</a></li>
        <strong>Noon - 1:30 pm</strong> Lunch break
        <strong>Afternoon, 1:30 pm - 5:00 pm</strong>
        <li><a href="/_episodes/06-sharc">Trajectory analysis with SHARC. Theory (60 min)</a></li>
        <li><a href="/_episodes/06-sharc">Trajectory analysis with SHARC. Hands on (60 min)</a></li>
        <li><a href="/_episodes/07-cobramm">SHARC with COMRAMM. Hands on (90 min)</a></li>
        
      </ul>
    </td>
    <td class="col-md-2">Sebastian Mai, Davide Avagliano </td>
  </tr>
  
  <tr>
    <td class="col-md-3">July 9, 2022 (Day 7), Saturday</td>
    <td class="col-md-7">On your own. Projects time</td>
    <td class="col-md-2"></td>
  </tr>

  <tr>
    <td class="col-md-3">July 10, 2022 (Day 8), Sunday</td>
    <td class="col-md-7">On your own. Projects time</td>
    <td class="col-md-2"></td>
  </tr>

  <tr>
    <td class="col-md-3">July 11, 2022 (Day 9), <strong>Monday</strong></td>
    <td class="col-md-7">
      <ul>
        <strong>Morning, 9 am - noon</strong>        
        <li><a href="/_episodes/09-pyunixmd">Theory of exact-factorization based TSH</a></li>
        <li><a href="/_episodes/09-pyunixmd">SHXF + alhpa</a></li>
        <strong>Noon - 1:30 pm</strong> Lunch break
        <strong>Afternoon, 1:30 pm - 5:00 pm</strong>
        <li><a href="/_episodes/09-pyunixmd">Demo and hands on with pyUNIxMD + DFTB</a></li>
        <li><a href="/_episodes/09-pyunixmd">Interfacing pyUNIxMD with external packages</a></li>
      </ul>
    </td>
    <td class="col-md-2">Seung Kyu Min, Dae Ho Han</td>
  </tr>

  <tr>
    <td class="col-md-3">July 12, 2022 (Day 10), Tuesday</td>
    <td class="col-md-7">
      <ul>
        <li><a href="/_episodes/10-ctmqc">Exact factorization-based calculatons with the CT-MQC code</a></li>
      </ul>
    </td>
    <td class="col-md-2">Lea-Maria Ibele </td>
  </tr>

  <tr>
    <td class="col-md-3">July 13, 2022 (Day 11), Wednesday</td>
    <td class="col-md-7">
      <ul>
        <li><a href="/_episodes/11-berkeleygw">Excited state calculations in condesned-matter systems with BerkeleyGW and paratec codes</a></li>
        <li><a href="/_episodes/12-paratec">Excited state calculations in condesned-matter systems with BerkeleyGW and paratec codes</a></li>
      </ul>
    </td>
    <td class="col-md-2">Peihong Zhang</td>
  </tr>

  <tr>
    <td class="col-md-3">July 14, 2022 (Day 12), Thursday</td>
    <td class="col-md-7">
      <ul>
        <li><a href="/_episodes/03-libra">Nonadiabatic dynamics in eQE and Libra/QE</a></li>
        <li><a href="/_episodes/13-hefeinamd">Nonadiabatic dynamics using Hefei-NA-MD code</a></li>        
      </ul>
    </td>
    <td class="col-md-2">Jin Zhao, Weibin Wang, Qijing Zheng, Mohammad Shakiba, and Alexey Akimov</td>
  </tr>

  <tr>
    <td class="col-md-3">July 15, 2022 (Day 13), Friday</td>
    <td class="col-md-7">
      <ul>
        <li><a href="/_episodes/14-tdksnamd"></a>Nonadiabatic dynamics calculations in extended systems with KS-TD-DFT NA-MD method</li>
        <li>Closing dinner.</li>
      </ul>
    </td>
    <td class="col-md-2">Dmitrii Kilin</td>
  </tr>

  <tr>
    <td class="col-md-3">July 16, 2022 (Day 14), Saturday</td>
    <td class="col-md-7">Departure.</td>
    <td class="col-md-2"></td>
  </tr>

  
  </table>



## Participation
### How to apply to the school

1. Read this page carefully
2. Prepare your application package (you will need it in the next steps)

   2.1. your CV (including graduate or undergraduate GPA)

   2.2. a statement of purpose PDF should describe in no more than 2 pages:

   * your current/ongoing research projects and interests; 
   * how you plan to use the CyberTraining skill gained in this workshop in your research, for instance if you expect using any of the
     packages that will be covered at this workshop (see the agenda);
   * propose at least one potential project to be completed during and shortly after the summer school; the project will be presented shortly after 
     the event (within 1 week). It should leverage one or more tools/software covered during the workshop (see the agenda). The quality and feasibility 
     of the proposed workshop projects will be considered during the selection of the participants. 
         
   2.3. request your advisor to submit a letter of recommendation for you to the following email: "alexeyak AT buffalo DOT edu", 
   please replace "AT" and "DOT" with the corresponding characters

3. Complete the <a href="https://forms.gle/91tpbpe98Q6RHdkv9" target="_blank" rel="nofollow">**Registration form**</a>


### Important dates
   * Workshop application materials are due 5 pm EDT, June 10, 2022
   * Students and Postdocs will be notified of their admission by June 15, 2022
   * Workshop starts: 9 am EDT, July 3, 2022
   * Workshop ends: 5 pm EDT, June 15, 2022


### Who can apply

This summer school is for graduate students, postdocs, and young faculty (and undergraduate in exceptional cases)
working in computational modeling of excited states and nonadiabatic dynamics, both in abstract and atomistic
applications/problems. The school aims to help researchers/students working either in 
methodology development for nonadiabatic or quantum-classical dynamics and in 
applied studies of various types of solar energy materials (photovoltaics, photocatalytics, etc.). 

Postdocs and researchers wishing to acquire the practical experience with new simulation
tools and expand their knowledge in the areas of excited states and nonadiabatic dynamics
are also welcome to participate.




### Selection and restrictions

* **Competitive selection** The applicants will be selected based on the strength of their statement of purpose, as well as the adequate 
  support of their supervisors and their level of fundamental preparation. The lack of training in specialized methods and software is not a problem. 
  What is more important is how ready the applicants are to absorb the new knowlege, how efficiently they can operate during the workshop, 
  and how critical the use of the methods/tools covered in the workshop may be for your future research or career (e.g. educating others). 

* **Capacity.** This year, the event will take place in a hybrid format. We will accommodate 15-20 in-person participants (excluding instructors).
  There is no limit to the capacity of the participants wishing to attend remotely, however the remote users who wish to utilize our CyberInfrastructure 
  have to use VPN to remotely access the cluster. There is a limit on how many VPNs the UBIT department can provide. Furthermore, participants 
  from certain countries with the export control limitations (e.g. China, Iran, Russia, etc.) can not be issued the UB VPN. The participants 
  from such countries can not use the UB CCR cyberinftrastructure during the hands-on activities. Such participants may still be 
  admitted to the theory talks/demo sessions. 


### Acknowledgement

This workshop is made possible by the NSF-OAC CyberTraining program. Thank you!



{% include links.md %}
