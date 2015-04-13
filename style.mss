// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';

// Common Colors //
@water: #eee; //#eeefff;
@park: #cec;
Map {
  background-color:#fff;
}


// Political boundaries //

#admin [maritime !=1 ]{
  // Countries
  [admin_level=2] {
    line-join: round;
    line-color:orange;//#333;
    line-opacity:0.6;
    line-comp-op: multiply;
    [zoom >= 2]{ line-width: 0.3; }
    [zoom >= 4]{ line-width: 0.6; }
    [zoom >= 6]{ line-width: 0.9; }
    [zoom >= 8]{ line-width: 1.1; }
    [zoom >= 10]{ line-width: 1.4; }
    [zoom >= 12]{ line-width: 1.8; }
    [disputed=1] { line-dasharray: 4,4; }
    ::double-stroke{
      line-color:lighten(orange,25%);// #ccc;
      line-opacity: 0.4;
      [zoom<6]{ line-width: 1; }
      [zoom>=6]{ line-width: 3.0; }
      [zoom>=8]{ line-width: 5.0; }
      [zoom>=10]{ line-width: 7.0; }
      [zoom>=12]{ line-width: 9.0; }
    }
  }
  // States / Provices / Subregions
  [zoom >=5][admin_level>=3] {
    line-join: round;
    line-opacity:0.4;
    line-dasharray: 4,2;
    line-width: 0.6;
  [zoom >= 6]{ line-width: 0.8; }
  [zoom >= 8]{ line-width: 1.0; }
  [zoom >= 10]{ line-width: 1.2; }
  [zoom >= 12]{ line-width: 1.6; }
    ::double-stroke{
      line-color: #ccc;
      line-opacity: 0.4;
      [zoom>=6]{ line-width: 2.0; }
      [zoom>=8]{ line-width: 4.0; }
      [zoom>=10]{ line-width: 6.0; }
      [zoom>=12]{ line-width: 9.0; }
    }
  }
}

/* GADM admin layer */
/*#admin0 [name != 'Syria']{
  polygon-fill: #ccc;
  polygon-comp-op: multiply;
}*/
  


// Places //

#country_label[zoom>=2][zoom<=4] {
  text-name: @name;
  text-face-name: 'Source Sans Pro Semibold';
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
    text-face-name: 'Source Sans Pro Semibold';
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
    text-face-name: 'Source Sans Pro Regular';
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
    text-face-name: 'Source Sans Pro Regular';
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
    text-face-name: 'Source Sans Pro Regular';
    text-fill: #333;
    text-size: 6;
    text-wrap-width: 100;
    text-wrap-before: true;
    [zoom>=14] { text-size: 10; }
    [zoom>=16] { text-size: 12; }
  }
}



// Landuse areas //

#landuse [class='park']{
  line-color: @park; 
  line-opacity:0.2;
  line-dasharray: 4,2;
  [zoom <= 5]{ line-width: 0.2; }
  [zoom = 6]{ line-width: 0.4; }
  [zoom = 7]{ line-width: 0.5; }
  [zoom = 8]{ line-width: 0.6; }
  [zoom = 9]{ line-width: 0.7; }
  [zoom = 10]{ line-width: 0.7; }
  [zoom = 11]{ line-width: 0.8; }
  [zoom >= 12]{ line-width: 0.8; }
}

#area_label {
  [class='park'] {
    [zoom<=13],  // automatic area filtering @ low zooms
    [zoom>=14][area>500000],
    [zoom>=16][area>10000],
    [zoom>=17] {
      text-name: @name;
      text-face-name: 'Source Sans Pro Italic';
      text-fill: darken(@park, 50%);
      text-size: 13;
      text-wrap-width: 100;
      text-wrap-before: true;
    }
  }
}


// Buildings //

#building {
  polygon-fill: #bbb;
  line-width:0.4;
  line-color: #999;
}


