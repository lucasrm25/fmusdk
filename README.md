# FMU SDK

This project is a fork of FMU SDK, a free software development kit provided by [Synopsys](https://www.synopsys.com/). It demonstrates basic use of Functional Mockup Units (FMUs) as defined by the following Functional Mock-up Interface specifications for

- [Model Exchange and Co-Simulation 2.0](https://svn.modelica.org/fmi/branches/public/specifications/v2.0/FMI_for_ModelExchange_and_CoSimulation_v2.0.pdf) (July 25, 2014)
- [Model Exchange 1.0](https://svn.modelica.org/fmi/branches/public/specifications/v1.0/FMI_for_ModelExchange_v1.0.pdf) (January 26, 2010)
- [Co-Simulation 1.0](https://svn.modelica.org/fmi/branches/public/specifications/v1.0/FMI_for_CoSimulation_v1.0.pdf) (October 12, 2010)

The FMI specifications are available from [here](http://fmi-standard.org/downloads). A short overview on FMUs and the FMI specification can be found [here](http://www.qtronic.de/doc/fmi_overview.pdf). The FMU SDK can also serve as starting point for developing applications that create or process FMUs.

For each of the supported FMI versions (currently 1.0 and 2.0), the FMU SDK contains the C sources for various discrete and continuous FMU models, a batch file for compiling and zipping these models, an XML parser for parsing the model description of an FMU and two simple simulation programs that run a given FMU and output the result as CSV file.

For bug reports, questions or contributions regarding the FMU SDK, please follow the [contribution guide](CONTRIBUTING.md).

![FMUs](docs/fmus.jpg)


# Installing the FMU SDK

The FMU SDK runs on 64 bit Linux platform. Download the FMU SDK from here, and unzip the file in a directory where you have write access. That directory is called FMUSDK_HOME below and may contain white space, such as in `C:/Program Files/fmusdk`. The FMU SDK contains only the C sources of the FMUs and the simulators, not the executables, and should be compile on Linux platform.

To build Linux or Mac OS X binaries of all FMUs and simulators, open command shell and run `make`. The build requires that you have installed the C and C++ compilers and the some external libraries. To install these dependencies on Linux you can use a package manager like apt:
```
sudo apt install g++
sudo apt install libexpat1-dev
sudo apt install libxml2-dev
sudo apt-get install libgsl-dev
``` 


### Building the FMUs with CMake

Install [CMake](https://cmake.org/) 3.2 or later, open a command line and change into the folder where you've cloned or extracted the FMU SDK.

For debug mode enter
```
mkdir debug
cd debug
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
```

and for release mode, enter
```
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
```

which builds all FMUs into the `dist` folder. To get a list of the available generators enter

```
cmake --help
```

Alternatively you can use [CMake's graphical user interface](https://cmake.org/runningcmake/) to generate the build pipeline. 


## Simulating an FMU

To run a given FMU with one of the FMU simulators, open the terminal in directory FMUSDK_HOME and run
```
<FMUSDK_HOME>/dist/fmu20/me/fmusim_20_me <FMUMODEL>.fmu <tEnd> <h> <loggingOn> <csvSeparator> [-win64]

  simulator ..... cs10 or cs20 for co-simulation, me10 or me20 for model exchange, required
  model.fmu ..... path to FMU, relative to current dir or absolute, required
  tEnd .......... end  time of simulation, optional, defaults to 1.0 sec
  h ............. step size of simulation, optional, defaults to 0.1 sec
  loggingOn ..... 1 to activate logging,   optional, defaults to 0
  csvSeparator .. c for comma, s for semicolon, optional, defaults to c
```

This unzips the given FMU, parses the contained modelDescription.xml file, simulates the FMU from t=0 to t=tEnd, and writes the solution to file `result.csv`. The file is written in CSV format (comma-separated values), using `;` to separate columns and using `,` instead of `.` as decimal dot to print floating-point numbers. To change the result file format, use the `CSV separator` option. The logging option activates logging of the simulated FMU. The FMI specification does not specify, what exactly to log in this case. However, when logging is switched on, the sample FMUs of the FMU SDK log every single FMU function call. Moreover, the fmusim simulators log every step and every event that is detected.

To plot the result file, open it e.g. in a spread-sheet program, such as Miscrosoft Excel or OpenOffice Calc. The figure below shows the result of the above simulation when plotted using OpenOffice Calc 3.0. Note that the height h of the bouncing ball as computed by fmusim becomes negative at the contact points, while the true solution of the FMU does actually not contain negative height values. This is not a limitation of the FMU, but of fmusim_me, which does not attempt to locate the exact time of state events. To improve this, either reduce the step size or add your own procedure for state-event location to fmusim_me.

![FMUs](docs/bouncingBallCalc.png)


## Creating your own FMUs

The FMU SDK contains a few sample FMUs

- [dq](fmu20/src/models/dq/index.html) the Dahlquist test function x = -k der(x)
- [inc](fmu20/src/models/inc/index.html) increments an integer counter every second
- [values](fmu20/src/models/values/index.html) demonstrates the use of all scalar FMU data types
- [vanDerPol](fmu20/src/models/vanDerPol/index.html) ODE with 2 continuous states
- [bouncingBall](fmu20/src/models/bouncingBall/index.html) a bouncing ball that defines state events

To implement your own FMU using the FMU SDK, create a directory - say xy - in `FMUSDK_HOME/fmu10/src/models`, or `FMUSDK_HOME/fmu20/src/models`, and create files xy.c there. The name of the new directory and of the .c file must be the same. The content of the .c file should follow the existing FMU examples, see the comments in the example code. Add file modelDescription_cs.xml used for co-simulation and modelDescription_me.xml used for model-exchange. When done with editing xy.c and the xml files, open a command shell in `FMUSDK_HOME/fmu10/src/models` or in `FMUSDK_HOME/fmu20/src/models` to run the build command.

The figure below might help to create or process the XML file modelDescription.xml. It shows all XML elements (without attributes) used in the schema files (XSD) for model exchange and co-simulation 1.0. Notation: UML class diagram.

![FMI 1.0 XML schema](docs/fmu10-xml-schema.png)

For the case of FMU 2.0, see the corresponding overview figure in the [FMI specification 2.0](https://svn.modelica.org/fmi/branches/public/specifications/v2.0/FMI_for_ModelExchange_and_CoSimulation_v2.0.pdf).


GSL (GNU Scientific Library) documentation:
https://www.gnu.org/software/gsl/doc/html/vectors.html


## License

The FMU SDK is provided by Synopsys under the [BSD 2-Clause License](LICENSE.md).

The following additional tools are distributed with the FMU SDK under their respective licenses:

- [7z 4.57](http://www.7-zip.org/) by Igor Pavlov, used here to zip and unzip FMUs ([7-Zip License for use and distribution](fmu10/bin/License.txt))
- [eXpat 2.0.1](http://sourceforge.net/projects/expat/) by James Clark, used here to parse the modelDescription.xml file of an FMU 1.0 ([MIT License](fmu10/src/shared/COPYING.txt))
- [libxml](http://xmlsoft.org/), the XML C parser and toolkit of Gnome, used here to parse the modelDescription.xml file of an FMU 2.0 ([MIT license](fmu20/src/shared/parser/libxml_license.txt)).

The contribution guide is adapted from [normalize.css](https://github.com/necolas/normalize.css) ([MIT License](https://github.com/necolas/normalize.css/blob/master/LICENSE.md)) and [chris.beams.io](https://chris.beams.io/posts/git-commit/)
