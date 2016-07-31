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

#water_label {
  [zoom<=13],  // automatic area filtering @ low zooms
  [zoom>=14][area>500000],
  [zoom>=16][area>10000],
  [zoom>=17] {
    text-name: @name;
    text-face-name: @font;
    text-fill: darken(@water, 40%);
    text-size: 13;
    text-wrap-width: 100;
    text-wrap-before: true;
  }
}