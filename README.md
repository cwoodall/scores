# Scores
> Music Scores composed by MuseScore 3

### Installing musescore on Ubuntu

https://musescore.org/en/handbook/3/install-linux#Ubuntu

Note: at present this is only workable with MuseScore 3 not 3.6
### Automation resources

https://musescore.org/en/handbook/3/command-line-options#Convert_a_score_to_PDF_from_the_command_line

```
mscore -o 'My Score.pdf' 'My Score.mscz'
```

Also Jobs are interesting

```
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
