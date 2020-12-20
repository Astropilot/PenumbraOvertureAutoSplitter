<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/Astropilot/PenumbraOvertureAutoSplitter/master/images/po.jpg" alt="Penumbra Overture" width="400">
</h1>

<h4 align="center">
Penumbra Overture - Auto Splitter</h4>

<p align="center">
  <a href="https://github.com/Astropilot/PenumbraOvertureAutoSplitter/releases/latest"><img src="https://img.shields.io/github/release/Astropilot/PenumbraOvertureAutoSplitter.svg" alt="Version"></a>
  <a href="https://github.com/Astropilot/PenumbraOvertureAutoSplitter/issues">
    <img src="https://img.shields.io/github/issues/Astropilot/PenumbraOvertureAutoSplitter"
         alt="Issues">
  </a>
  <a href="https://github.com/Astropilot/PenumbraOvertureAutoSplitter/pulls">
    <img src="https://img.shields.io/github/issues-pr-raw/Astropilot/PenumbraOvertureAutoSplitter"
         alt="Issues">
  </a>
  <img src="https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F-yellow.svg">
</p>

<p align="center">
  <a href="#about">About</a> •
  <a href="#usage">Usage</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#authors">Authors</a>
</p>

## About

This repository contains the ASL script (`Penumbra_Overture.asl`) that allows [LiveSplit](https://livesplit.org/) to auto-split, to remove load times and auto-reset at the start of a new game.

This repository also contains the following files:
* `Penumbra Overture - Any% QSA (Quick-Saves Allowed).lss` : This is a split file for LiveSplit containing all the possible splits corresponding to level changes
* `CE_Tables/penumbra_overture_1.0.CT` : A [CheatEngine](https://www.cheatengine.org/) table with the different addresses used by the script for development and debugging purposes. This version concerns version 1.0.X of Overture!
* `CE_Tables/penumbra_overture_1.1.CT` : A [CheatEngine](https://www.cheatengine.org/) table with the different addresses used by the script for development and debugging purposes. This version concerns version 1.1 (Steam) of Overture!

This script supports the following versions of Penumbra Overture:
* The Steam version (1.1)
* The GOG version (1.0)

## Usage

Open LiveSplit's splits editor and enter in the game's name. The autosplitter should appear above the splits. Simply click the Activate button.

If the plugin doesn't appear in LiveSplit automatically then you must download the script [here](https://github.com/Astropilot/PenumbraOvertureAutoSplitter/releases/latest), add Control -> Scriptable Auto Splitter to your layout, open the layout settings, and point it to the file `Penumbra_Overture.asl`.<br>
This is generally only used to test new scripts and normally shouldn't be used.

## Contributing

We would be happy to see you contribute to the development of the script!

In order to debug the current script, you are provided with a [CheatEngine](https://www.cheatengine.org/) table for each of the two versions.
The source code of the game and the game engine HPL1 are opened by Frictional Games and are available on their [github repository](https://github.com/FrictionalGames).

You can open a issue in case of a problem or fork this repository to propose a modification via a pull request.

## Authors

|               | Github profile                                        | Discord                                             |
|---------------|:-----------------------------------------------------:|:---------------------------------------------------:|
| MagicALCN     | [TheMagicAlicorn](https://github.com/TheMagicAlicorn) | MagicALCN#0411                                      |
| Astropilot    | [Astropilot](https://github.com/Astropilot)           | \[Anos]#2347                                     |
| Kotti         |                                                       | Kotti#4747                                          |
| PsychoManiac  |                                                       | PsychoManiac#0470                                   |
