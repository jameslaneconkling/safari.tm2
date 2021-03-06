/*
#country_label[zoom>=2][zoom<=4] {
  text-name: @name;
  text-face-name: @font;
  text-wrap-width: 100;
  text-wrap-before: true;
  text-fill: #999999;
  text-halo-radius: 1;
  text-halo-fill: white;
  text-size: 12;
  [zoom>=3][scalerank=1],
  [zoom>=4][scalerank=2],
  [zoom>=5][scalerank=3],
  [zoom>=6][scalerank>3] {
    text-size: 14;
  }
  [zoom>=4][scalerank=1],
  [zoom>=5][scalerank=2],
  [zoom>=6][scalerank=3],
  [zoom>=7][scalerank>3] {
    text-size: 16;
  }
}
*/

/*
#place_label [zoom>=5]{
  [type='city'][zoom<=15] {
    text-halo-fill: white;
    text-halo-radius:  1;
    text-name: @name;
    text-face-name: @font;
    text-fill: #444;
    text-size: 9;
    text-wrap-width: 100;
    text-wrap-before: true;
    [zoom>=5] { text-size: 10; }
    [zoom>=8] { text-size: 14; }
    [zoom>=10] { text-size: 16; }
    [zoom>=12] { text-size: 18; }
  }
  [type='town'][zoom>=8][zoom<=17] {
    text-halo-fill: white;
    text-halo-radius:  1;
    text-name: @name;
    text-face-name: @font;
    text-fill: #333;
    text-size: 9;
    text-wrap-width: 100;
    text-wrap-before: true;
    [zoom>=10] { text-size: 12; }
    [zoom>=12] { text-size: 14; }
  }
  [type='village'][zoom>=11] {
    text-halo-fill: white;
    text-halo-radius:  1;
    text-name: @name;
    text-face-name: @font;
    text-fill: #333;
    text-size: 8;
    text-wrap-width: 100;
    text-wrap-before: true;
    [zoom>=12] { text-size: 10; }
    [zoom>=14] { text-size: 12; }
  }
  [type='hamlet'][zoom>=12],
  [type='suburb'][zoom>=12],
  [type='neighbourhood'][zoom>=12] {
    text-halo-fill: white;
    text-halo-radius:  1.2;
    text-name: @name;
    text-face-name: @font;
    text-fill: #333;
    text-size: 6;
    text-wrap-width: 100;
    text-wrap-before: true;
    [zoom>=14] { text-size: 10; }
    [zoom>=16] { text-size: 12; }
  }
}


#area_label {
  [class='park'] {
    [zoom<=13],  // automatic area filtering @ low zooms
    [zoom>=14][area>500000],
    [zoom>=16][area>10000],
    [zoom>=17] {
      text-name: @name;
      text-face-name: @font;
      text-fill: darken(@park, 50%);
      text-size: 13;
      text-wrap-width: 100;
      text-wrap-before: true;
    }
  }
}
*/

@halo: @bg;

#place_label {
  /*
  shield-file: url("img/dot-3.png");
  shield-face-name: @font;
  shield-name: @name;
  shield-face-name: @sans;
  shield-size: 12;
  shield-fill: #444;
  shield-halo-fill: @bg;
  shield-halo-radius: 1;
  shield-unlock-image: true;
  shield-wrap-width: 80;
  //shield-line-spacing: -2;
  
  // Fine-tune label positioning.
  [ldir='E'] { shield-text-dx: 6; }
  [ldir='W'] { shield-text-dx: -6; }
  [ldir='N'] { shield-text-dy: -5; }
  [ldir='S'] { shield-text-dy: 6; }
  [ldir='NE'] { shield-text-dx: 3; shield-text-dy: -3; }
  [ldir='SE'] { shield-text-dx: 3; shield-text-dy: 3; }
  [ldir='SW'] { shield-text-dx: -3; shield-text-dy: 3; }
  [ldir='NW'] { shield-text-dx: -3; shield-text-dy: -3; }

  [zoom>=6] { shield-size: 14; }

  // Emphasize major cities.
  [scalerank<=6] { shield-size: 14; }
  [zoom>=6][scalerank<=6] { shield-size: 16; } 
  
  shield-margin: 10;
  */

  text-face-name: @font;
  text-name: [name];
  text-fill: #222;
  text-halo-fill: @halo;
  text-halo-radius: 1;
  text-halo-opacity: 1;
  //text-dy: -5;
  text-size: 7;
  text-margin: 20;
  [type='hamlet'] {
    // zoom 13+
    text-fill: #666;
    [zoom=13] { text-size: 8; }
    [zoom=14] { text-size: 10; }
    [zoom>=15] { text-size: 13; }
  }
  [type='village'] { 
    // zoom 9+
    text-fill: #666;
    [zoom>=9] { text-size: 8; }
    [zoom>=10] { text-size: 9; }
    [zoom>=12] { text-size: 10; }
    [zoom>=14] { text-size: 12; }
  }
  [type='town'] { 
    // zoom 6+
    text-fill: #444;
    [zoom>=6] { text-size: 7; }
    [zoom>=8] { text-size: 9; }
    [zoom>=10] { text-size: 11; }
    [zoom>=12] { text-size: 13; }
    [zoom>=14] { text-size: 15; }
  }
  [type='city'] { 
    // zoom 4+
    [zoom>=4] { text-size: 7; }
    [zoom>=6] { text-size: 10; }
    [zoom>=8] { text-size: 12; }
    [zoom>=10] { text-size: 14; }
    [zoom>=12] { text-size: 16; }
    [zoom>=14] { text-size: 18; }
  }
  //marker-width: 2;
  //marker-line-width: 0;
  //marker-fill: #444;
}

/*
  shield-name: @name;
  shield-face-name: @sans;
  shield-size: 12;
  shield-fill: @text;
  shield-halo-fill: @land;
  shield-halo-radius: 1;
  shield-unlock-image: true;
  shield-file: url("dot.svg");
  shield-wrap-width: 80;
  shield-line-spacing: -2;

  // Fine-tune label positioning.
  [ldir='E'] { shield-text-dx: 6; }
  [ldir='W'] { shield-text-dx: -6; }
  [ldir='N'] { shield-text-dy: -5; }
  [ldir='S'] { shield-text-dy: 6; }
  [ldir='NE'] { shield-text-dx: 3; shield-text-dy: -3; }
  [ldir='SE'] { shield-text-dx: 3; shield-text-dy: 3; }
  [ldir='SW'] { shield-text-dx: -3; shield-text-dy: 3; }
  [ldir='NW'] { shield-text-dx: -3; shield-text-dy: -3; }

  [zoom>=6] { shield-size: 14; }

  // Emphasize major cities.
  [scalerank<=6] { shield-size: 14; }
  [zoom>=6][scalerank<=6] { shield-size: 16; } 
*/

#poi_label [maki='park'],
#poi_label [type='Glacier'],
#poi_label [type='Peak'],
#poi_label [type='Archipelago'],
#poi_label [type='Island']{ 
  text-name: [name];
  text-wrap-width: 40;
  text-halo-fill: @halo;
  text-halo-radius: 1.2;
  text-halo-opacity: 0.8;
  text-face-name: @serif;
  [type='Island'],
  [type='Archipelago'],
  [maki='park'] { 
    text-fill: #222; //#50877d;
    text-line-spacing: 4;
    text-character-spacing: 1;
    [zoom < 10]{ text-size: 12; }
    [zoom >= 10]{ text-size: 14; }
    [zoom >= 12]{ text-size: 18; }
    [zoom >= 12]{ text-size: 22; }
  }
  [type='Glacier'] { 
    text-fill: #222;
    text-transform: uppercase;
    text-line-spacing: 4;
    text-character-spacing: 1;
    [zoom >= 12]{ text-size: 14; }
  }
  [type='Peak'] { 
    text-face-name: @serif-bold;
    text-fill: #000;
    text-transform: uppercase;
    text-line-spacing: 6;
    text-character-spacing: 1;
    [zoom >= 12]{ text-size: 8; }
  }
}

#water_label {
  [zoom<=13],  // automatic area filtering @ low zooms
  [zoom>=14][area>500000],
  [zoom>=16][area>10000],
  [zoom>=17] {
    text-name: @name;
    text-face-name: @serif-italic;
    text-fill: darken(@water, 20%);
    text-size: 13;
    text-wrap-width: 100;
    text-wrap-before: true;
    text-halo-fill: lighten(@water, 10%);
    text-halo-radius: 1;
  }
}

#waterway_label {
  text-name: @name;
  text-face-name: @serif-italic;
  text-fill: darken(@water, 40%);
  text-placement: line;
  text-repeat-distance: 200;
  text-size: 8;
  text-halo-fill: lighten(@water, 10%);
  text-halo-radius: 1;
}