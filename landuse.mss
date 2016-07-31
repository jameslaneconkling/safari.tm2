/*
patterns
* wood
* cliff
* rock
* wetland
* water halo
* bg?
*/

#landuse {
  polygon-fill: transparent;
  /*[class='park'] {
    ::halo {
      line-color: @park;
      line-comp-op: multiply;
      line-width: 0;
      [zoom>=8]{ 
        line-width: 1;
        line-offset: -0.5;
      }
      [zoom>=10]{ 
        line-width: 4;
        line-offset: -2;
      }
    }
    line-color: darken(@park, 15%);
    line-width: 0.5;
    [zoom>=8]{ line-width: 0.5; }
    [zoom>=10]{ line-width: 0.8; }
    [zoom>=12]{ line-width: 1; }
    [zoom>=14]{ line-width: 1.2; }
  }*/
  [class='agriculture'] {
   // polygon-fill: #fafa9a;
   // line-color: #e8e8a8;
    line-color: #ccc;
    polygon-pattern-file: url(img/pattern/noise.png);
    [zoom<=9]{ line-width: 0.4; }
    [zoom=10]{ line-width: 0.4; }
    [zoom>=11]{ line-width: 0.4; }
  }
  [class='wood'] {
    polygon-comp-op: multiply;
    polygon-pattern-file: url(img/pattern/noise.png);
    polygon-fill: @wood;
    //::pattern {
      //polygon-pattern-file: url(img/pattern/noise.png);
    //}
  }
  [class='scrub'] {
    //polygon-fill: red;
  }
  [class='grass'] {
    //polygon-fill: red;
  }
  [class='sand'] {
    //polygon-fill: blue;
  }
  [class='rock'] {
    //polygon-pattern-alignment: local;
    //polygon-pattern-file: url(img/pattern/cliff-md.png);
    [zoom>=13] {
      //polygon-pattern-file: url(img/pattern/cliff-lg.png);
    }
  }
  [class='glacier'] {
    //polygon-fill: orange;
  }
}
/*
#landuse_overlay {
  polygon-fill: #dfa;
  polygon-comp-op: multiply;
}
*/

#landcover {
  polygon-opacity: 0.6;
  polygon-comp-op: multiply;
  polygon-fill: transparent;
  [class='wood'] {
    //polygon-fill: @wood;
  }
  [class='scrub'] {
    //polygon-fill: @scrub;
  }
  [class='grass'] {
    //polygon-fill: @grass;
  }
  [class='crop'] {
    //polygon-fill: @crop;
  }
  [class='snow'] {
    //polygon-fill: @snow;
  }
}


/*
#landuse {
  // The ::cover attachments fade in and become solid, overriding
  // any underlying shaped in the #landcover layer.
  ::cover33 { opacity: 0.33; }
  ::cover66 { opacity: 0.66; }
  ::cover33[zoom=13],
  ::cover66[zoom=14],
  ::cover[zoom>=15] {
    // Bring in OSM landcover only at higher zoom levels where
    // the higher level of detail makes sense.
    [class='wood'] { polygon-fill: @wood; }
    [class='scrub'] { polygon-fill: @scrub; }
    [class='grass'] { polygon-fill: @grass; }
    [class='crop'] { polygon-fill: @crop; }
    [class='sand'] { polygon-fill: @sand; }
    [type='golf_course'],[type='rough'] { polygon-fill: darken(@park,10); }
  }
  ::cover33[zoom=10],
  ::cover66[zoom=11],
  ::cover[zoom>=12] {
    [class='rock'] { polygon-fill: @rock; }
  }
}

#landuse::use {
  // The ::use attachement is multuplied over #landcover and
  // #landuse::cover*, letting trees, grass, etc show through
  // where they occur in parks, schools, etc.
  comp-op: multiply;
  [class='cemetery'] {
    polygon-fill: @cemetery;
    line-color: @cemetery*0.95;
    line-offset: -0.5;
  }
  [class='hospital'] {
    polygon-fill: @hospital;
    line-color: @hospital*0.95;
    line-offset: -0.5;
  }
  [class='industrial'] {
    polygon-fill: @builtup;
    line-color: @builtup*0.95;
    line-offset: -0.5;
  }
  [class='park'] {
    polygon-fill: @park;
    line-color: @park*0.95;
    line-offset: -0.5;
  }
  [class='pitch'][zoom>=15] {
    polygon-fill: @pitch;
    line-color: #fff;
    line-width: 0.5;
    [zoom>=16] { line-width: 1; }
    [zoom>=17] { line-width: 1.5; }
    [type='green'] {
      polygon-fill: darken(@pitch,20);
      line-color: darken(@pitch,5);
      line-width: 1;
      [zoom>=17] { line-width: 1.5; }
      [zoom>=18] { line-width: 2; }
    }
    [type='fairway'],
    [type='tee']{
      polygon-fill: darken(@pitch,5);
      line-color: darken(@pitch,20);
    }
  }
  [class='sand'] {
    polygon-fill: @sand;
    [type='bunker'] {
      polygon-fill: darken(@sand,5);
      line-color: darken(@sand,14);
    }
  }
  [class='school'] {
    polygon-fill: @school;
    line-color: @school*0.95;
    line-offset: -0.5;
  }
}
*/


#landuse_overlay {
  polygon-clip: false;
  polygon-smooth: 1;
  [class='wetland'] {
    polygon-fill: fadeout(@water,80);
    polygon-pattern-file: url(img/pattern/wetland_16.png);
    polygon-pattern-opacity: 0.5;
    polygon-pattern-alignment: global;
    [zoom>=13] { polygon-pattern-file: url(img/pattern/wetland_32.png); }
    [zoom>=14] { polygon-pattern-file: url(img/pattern/wetland_64.png); }
  }
  [class='wetland_noveg'] {
    polygon-fill: fadeout(@water,80);
    polygon-pattern-file: url(img/pattern/wetland_noveg_16.png);
    polygon-pattern-opacity: 0.5;
    polygon-pattern-alignment: global;
    [zoom>=13] { 
      polygon-pattern-file: url(img/pattern/wetland_noveg_32.png);
    }
    [zoom>=14] { polygon-pattern-file: url(img/pattern/wetland_noveg_64.png); }
  }
  [class='breakwater'],
  [class='pier'] {
    polygon-fill: @bg;
  }
}
