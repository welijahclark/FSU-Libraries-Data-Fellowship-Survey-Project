# FSU-Libraries-Data-Fellowship-Survey-Project-Code-Book

Thank you for visiting this repository! 

As a disclaimer, the data used for this survey was confidential student survey data that was analyzed in context of my data fellowship at Florida State University.
If you would like to ask for more information about this project, please email nruhs@fsu.edu with your questions regarding the data itself.

#Variable Coding#

Question 1 [Q1]: Description of academic level. Survey respondents were numerically coded as 1 = First Year, 2 = Second Year, 3 = Third Year, 4 = Fourth Year, with 5 = Five+ Year, Graduate students, and Post-Baccalaureate students in one group. 0=Other (e.g. non-FSU students).

Question 2 [Q2]: Description of respondent’s major. This first version of this variable [Q2NV1] was coded 0 = Arts and Humanities, 1 = Social Sciences and/or Business, and 2 = STEM, whereas the second version of this variable [Q2NV2] was coded as 0 = Arts and Humanities, 1 = Social Sciences, 2 = Business, and 3 = STEM. 

Question 3 [Q3]: Description of whether a survey respondent heard of a research data service. This question yielded six different variables. The first five were for each individual research data service, where 0=did not hear of that specific service and 1 = heard of that specific service. There was also a variable added for hearing of at least one research data service, where 0=did not hear of any services and 1 = heard of at least one service. 
  #Additional Note: A-E at the end of a Q3 variable in the R code refers to each individual data service in the question.
  
Question 4 [Q4]: Description of whether someone proceeded to use a research data service. The question was coded as a binary variable, where No = 0 = did not use any research data services and Yes = 1 = used at least one research data service.
   #Additional Note: A-E at the end of a Q4 variable refers to each individual data service in the question.
   
Question 5 [Q5]: Description of whether a survey respondent used research data service. This question yielded six different variables. The first five variables were for each individual research data service, where 0 = did not use that specific service, and 1 = used that specific service.

Question 6 [Q6]: This survey question measured how often a respondent who used services would proceed to use a service.

Question 7 [Q7.1N, Q7.2N, Q7.3N]: This survey question yielded three separate variable groups for the three statements in the question. For each individual statement, there was an associated value where 1 = Strongly Disagree, 2 = Disagree, 3 = Neither Agree nor Disagree, 4 = Agree, and 5 = Strongly Agree.

Question 8 [Q8]: This open-response question allowed for further commentary on the survey itself and/or research data services. 

Library Staff [LibStaff, RankedLibStaff] : The beta test version of our survey included OPS workers, most of whom were also students. Due to this pre-existing data, we could merge the initial and final survey data into one data file. Statistical testing between the first and second survey groups yielded no statistically significant difference in response patterns, so we elected to use the combined dataset.


Survey Design
	In order to gather data for this research endeavor, we implemented two rounds of a 1-2 minute survey with eight questions. 
For our beta version of the survey that was tested with OPS staff within FSU Libraries, the questions that were asked were as follows:
1.	“What is your current academic standing?”
○	First-year
○	Second-year
○	Third-year
○	Fourth-year
○	Post-baccalaureate
○	Graduate
○	Other
2.	What is your major?
○	Open response text box
3.	Which of the following FSU research data services have you heard of? (Research Data Services are defined as "library resources to help students and faculty manage, find, use, analyze, store, and learn about data.")
○	Workshops and training opportunities
○	Consultations with data librarians
○	Data reference hours
○	Research data management
○	Data repositories and statistical databases
○	None of the above
4.	Have you used any data services from the FSU Libraries system this semester?
○	Yes
○	No
○	I don’t know
5.	[If “No” was selected for 4, this question was skipped] Which of the following data services have you used?
○	Workshops and training opportunities
○	Consultations with data librarians
○	Data reference hours
○	Research data management
○	Data repositories and statistical databases
○	None of the above
6.	[If “No” was selected for 4, this question was skipped] On average, how often do you use any data services from the FSU Libraries system?
○	More than once a week
○	At least once a week
○	More than once a month
○	At least once a month
○	Less than once a month
7.	On a scale of “Strongly Agree” to “Strongly Disagree” how much would you agree with each of the following statements?
○	“Data literacy is important to my career”?
i.	Strongly Disagree
ii.	Disagree
iii.	Neither Agree Nor Disagree
iv.	Agree
v.	Strongly Agree
○	“Data analysis is important to my career”?
i.	Strongly Disagree
ii.	Disagree
iii.	Neither Agree Nor Disagree
iv.	Agree
v.	Strongly Agree
○	“Data visualization is important to my career”?
i.	Strongly Disagree
ii.	Disagree
iii.	Neither Agree Nor Disagree
iv.	Agree
v.	Strongly Agree
8.	What additional data services from FSU Libraries would you be interested in seeing?
○	Open response text box

Using additional information given to us from respondents for the beta survey on how to improve the final survey for accessibility, we were also able to implement a final version of the survey with slightly modified questions and answers.
1.	What is your current academic standing?
○	First-year
○	Second-year
○	Third-year
○	Fourth-year
○	Fifth-year or more
○	Post-baccalaureate
○	Graduate
○	Other
2.	What is your major?
○	Open-response text box
3.	Which of the following FSU research data services have you heard of? Please check all that apply. (Research Data Services are defined as "library resources to help students and faculty manage, find, use, analyze, store, and learn about data".)
○	Workshops and training opportunities (e.g. Intro to Python Bootcamp, R, MATLAB, SPSS, QGIS, etc)
○	Consultations with data librarians (e.g. scheduling an appointment with a subject librarian to ask about specialized questions)
○	Data reference hours (i.e. using the “Ask a Data Librarian” feature on the FSU Libraries website to chat with a data librarian)
○	Research data management (i.e. consulting with research librarians to develop a research data preservation plan for your research)
○	Data repositories and statistical databases (e.g; using DigiNole to store your own research data, using the FSU Libraries website to find data)
○	None of the above
4.	Have you used any FSU research data services this semester?
○	Yes
○	No
○	I don’t know
5.	Which of the following FSU research data services have you used? Please check all that apply.
○	Workshops and training opportunities (e.g. Intro to Python Bootcamp, R, MATLAB, SPSS, QGIS, etc)
○	Consultations with data librarians (e.g. scheduling an appointment with a subject librarian to ask about specialized questions)
○	Data reference hours (i.e. using the “Ask a Data Librarian” feature on the FSU Libraries website to chat with a data librarian)
○	Research data management (i.e. consulting with research librarians to develop a research data preservation plan for your research)
○	Data repositories and statistical databases (e.g; using DigiNole to store your own research data, using the FSU Libraries website to find data)
○	None of the above
6.	On average, how often do you use any FSU research data services?
○	More than once a week
○	At least once a week
○	More than once a month
○	At least once a month
○	Less than once a month
7.	On a scale of “Strongly Agree” to “Strongly Disagree” how much would you agree with each of the following statements?
○	“The ability to critically think about and evaluate data (data literacy) is important to my academics and future career.”
i.	Strongly Disagree
ii.	Disagree
iii.	Neither Agree Nor Disagree
iv.	Agree
v.	Strongly Agree
○	“The ability to analyze data is important to my academics and future career.”
i.	Strongly Disagree
ii.	Disagree
iii.	Neither Agree Nor Disagree
iv.	Agree
v.	Strongly Agree
○	“The ability to visualize data is important to my academics and future career.”
i.	Strongly Disagree
ii.	Disagree
iii.	Neither Agree Nor Disagree
iv.	Agree
v.	Strongly Agree
8.	What additional research data services from FSU Libraries would you be interested in seeing?
○	Open-response text box

The survey was implemented in Qualtrics and distributed via a QR code on fliers around the FSU campus that respondents could scan, with the fliers having an incentive for potential rewards written on the fliers. The QR code would lead to the link for the Qualtrics survey and had a disclosure statement for anonymity and the purpose of the survey before a respondent would start the survey. 

