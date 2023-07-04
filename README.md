# RobotFrameworkForMe
## Download python
https://www.python.org/downloads/
## Diplay All paths in new lines
```cmd
echo %path:;=&echo.%
```
## Install Python & Pip
Install python as admin. Ensure add python to path is checked during installation at step1  
Default location : C:\Users\ravi\AppData\Local\Programs\Python\Python311  
Disable Path Length Limit on the last step  
Python -V //to check python version (capital V)   
Pip -V //to check pip version  (Capital V)  
pip list //for upgrade directions  
pip install --upgrade --no-cache-dir package1  

## Install Robot Framework & Selenium Library
This will install both selenium library as well as robotframework
```pip
Pip install robotframework-seleniumlibrary
```
## Library for API Requests
```pip
pip install robotframework-requests
```
## Note : Libraries
1. https://pypi.org/ is to look for the libraries
2. Better way to find libraries is to go to the robotframework.org and scroll down to libraries section

## Selenium Keyword documentation
https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

## Install Pycharm IDE
https://www.jetbrains.com/pycharm/  
Right Click and run as admin  
Select the check boxes
1. Create Assosciations for .py
2. Add bin to the Path

## Install Plugins
File - > Settings ->  Plugins ->Market Place
1. Seach for intellibot and install the the one with the current date irrespective of any name (intellibot*)
2. Intellibot(#patched) is latest as of documentating this
3. Customize->AllSettings->Robot Options->Ensure the "Expand Adjacent 2 0r 3 spaces" check box is checked.

## Interpreter Settings
1. Virtual Env 
Virtualenv is for the people who use different versions of python for different projects  
File->Settings->Python Interpreter->Add Interpreter->New->Location->Select the root path where all your projects exists so that other projects can use this file later->Select the Inherit-Global Site packages check box  
2. System Interpreter (Preferred initially)  
File->Settings->Python Interpreter->Add Interpreter->System Interpreter->Point it to the python.exe
"C:\Users\ravi\AppData\Local\Programs\Python\Python311\python.exe"

## Folder Structure
All of these folders have plain text files ending with .robot extension  
1. Resources  
2. Results  
3. Tests  

## Script Format
.robot extension  
2-4 Space or tabs seperated or pipe seperated  
Keyword Driven   
Natural Language   

## Sections of the script file
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-data-sections
1. Settings
   1. Documentation
   2. Library
   3. Resource
   4. Suite Setup/Suite TearDown
   5. Test Setup/ Test TearDown
   6. Test Timeout 5s
2. Variables
3. Test Cases
   1. [Documentation]
   2. [Tags]
   3. [Timeout] 10s
4. KeyWords
5. Tasks (Related to RPA)
6. Comments (Related to RPA)

## Libraries
1. Built-In
2. External (SeleniumLibrary). Can be installed using pip install PackageName

## Script Layers
1. .robot->SeleniumLibrary->Selenium(Chrome,Edge,Firefox)
2. .robot->KeywordFile->PageObject->Library->Drivers->Execution

## Command line Execution
View-->Tool Windows->Terminal
1. Here --include smoke is including smoke tags
2. -d result is pointing to the result folder. It can be absolute path or any other path on the shared network
3. -N to give a new name to the test report
4. -t to execute a particular test case with its name in a given file
5. -i to execute test cases based on the tag
```pip 
robot -d Results --include smoke Tests/MyScript.robot
robot -d Results -i smoke Tests/MyScript.robot
robot -d Results Tests/Mysript.robot
robot -d c:\RobotResults\Results  Tests/Mysript.robot
robot -N "New Name" -d Results -t "Should be able to login to the crm web application" Tests/CRM.robot
```

## Run from batch file
```bat
#@echo off
cd "C:\development\RobotScripts\RobotFrameworkForMe\Tests"
robot -d Results -v BROWSER:Chrome CRM.robot
robot -d Results -v BROWSER:Edge CRM.robot
pause
```

## Resources
1. Resources path is expected to be a fully qualified path (Absolute or Relative). Hence prefixed with ../ in the keyword-demo.robot
2. Best practise is to prefix the Keywordfilename.step that we want to use in actual test case 

## Variables
### Scalar Variables
To hold single value
${Browser}  =     chrome
${SuiteName}   =     Set variable  somesuite

### List Variables
To hold multiple values. Use '@' sign instead of '$' sign
```pip
@{intArray}         0  1  2
@{strArray}         set variable    Ravi       Kumar       Gajul
@{strArray}        create list    Gajul       Kumar       Ravi
log ${intArray}[0]
log ${intArray}[1]
log ${intArray}[2]
log ${strArray[3]
```

## Scope of variables
Order of precedence 
command > Script(Tests->*.robot) > Keywords(Resources>-*.robot)
Pass variables through cmd
Syntax: -v variablename:value
```pip
robot -d Results -v Browser:Edge Tests/keyword-demo.robot
```

## Passing Variables to Keywords
1. The keywords step as below should be declared
```pip
Login to the application and maximize the browser
    [Arguments]    ${URL}
    go to          ${URL}
```
1. The Calling step should pass ${URL} as parameter. The url precedence is as explained in above step
```pip
Login to the application and maximize the browser   ${URL}
```
## SetUp & TearDown


id and name are the primary and default locator
## Issues
1. TypeError: WebDriver.__init__() got an unexpected keyword argument 'service_log_path'
   1. known issue(Open): https://github.com/robotframework/SeleniumLibrary/issues/1835
   2. Downgrading selenium from 4.10.0 to 4.9.0 helped
   3. pip install selenium==4.9.0

