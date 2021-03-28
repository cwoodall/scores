# Scores
> Music Scores composed by MuseScore 3.6

### Installing musescore using FlatPak

At present there are no MuseScore 3.6 releases for Ubuntu that can be installed via apt. A flatpak and a AppImage are available. I have found
the flatpak to be the most convenient option:

```
sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y --noninteractive flathub org.musescore.MuseScore          
```
### Automation resources

When automating musescore I found it to be nice to use an alias:

```
alias mscore="flatpak run org.musescore.MuseScore"
```

So for example you can [convert a file into a pdf, mp3, midifile, etc](https://musescore.org/en/handbook/3/command-line-options#Convert_a_score_to_PDF_from_the_command_line
). Using the following command. This will work for `.mscz` or `.mscx` files:

```
mscore -o 'My Score.pdf' 'My Score.mscz'
```

You can also use this against `.json` jobs files:

```json
[
  {
    "in": "Reunion.mscz",
    "out": "Reunion-coloured.pdf",
    "plugin": "colornotes.qml"
  },
  {
    "in": "Reunion.mscz",
    "out": [
      "Reunion.pdf",
      [ "Reunion (part for ", ").pdf" ],
      "Reunion.musicxml",
      "Reunion.mid"
    ]
  },
  {
    "in": "Piece with excerpts.mscz",
    "out": [
      "Piece with excerpts (Partitura).pdf",
      [ "Piece with excerpts (part for ", ").pdf" ],
      "Piece with excerpts.mid"
    ]
  }
]
```

With:

```
mscore -j job-file.json
```

I have added these to a [Makefile](./Makefile) which can make pdfs of scores, run jobs and can also make mp3s

These automations get run automatically and committed on push by a github action