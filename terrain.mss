// Common Colors //

@land: #f4efe1;
@water: #cdd;
@water_dark: #185869;  // for the inline/shadow
@crop: #eeeed4;
@grass: #e7ebd1;
@scrub: #e0e8cd;
@wood: #d4e2c6;
@snow: #f4f8ff;
@rock: #ddd;
@sand: mix(#ffd,@land,33%);
// These colors need to take `comp-op:multiply` into account:
@cemetery: #edf4ed;
@pitch: fadeout(#fff,50%);
@park: #edf9e4;
@piste: mix(blue,@land,5);
@school: #fbf6ff;
@hospital: #fff0f0;
@builtup: #f6faff;


// Mapbox Terrain global landcover //
/*
#landcover {
  [class='wood'] { polygon-fill: @wood; }
  [class='scrub'] { polygon-fill: @scrub; }
  [class='grass'] { polygon-fill: @grass; }
  [class='crop'] { polygon-fill: @crop; }
  [class='snow'] { polygon-fill: @snow; }
  // fade out stronger classes at high zooms,
  // let more detailed OSM data take over a bit:
  [class='wood'][zoom>=14],
  [class='scrub'][zoom>=15],
  [class='grass'][zoom>=16] {
    [zoom>=14] { polygon-opacity: 0.8; }
    [zoom>=15] { polygon-opacity: 0.6; }
    [zoom>=16] { polygon-opacity: 0.4; }
    [zoom>=17] { polygon-opacity: 0.2; }
  }
}*/

/*#landcover {
  comp-op: multiply;
  [class='crop']{ polygon-fill: #f0f0f0; }
}*/

// OSM landuse & landcover //
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
}*/

#landuse_overlay {
  // Landuse/landcover areas that need to be drawn above the water layer.
  polygon-fill: rgba(0,0,0,0);
  polygon-clip: false;
  [class='wetland'] {
    polygon-fill: fadeout(@water,80);
    [zoom>=12] {
      //polygon-pattern-file: url(img/pattern/wetland_16.png);
      //polygon-pattern-opacity: 0.5;
      //polygon-pattern-alignment: global;
    }
    //[zoom>=13] { polygon-pattern-file: url(img/pattern/wetland_32.png); }
    //[zoom>=14] { polygon-pattern-file: url(img/pattern/wetland_64.png); }
  }
  [class='wetland_noveg'] {
    polygon-fill: fadeout(@water,80);
    [zoom>=12] {
      ///polygon-pattern-file: url(img/pattern/wetland_noveg_16.png);
      //polygon-pattern-opacity: 0.5;
      //polygon-pattern-alignment: global;
    }
    //[zoom>=13] { polygon-pattern-file: url(img/pattern/wetland_noveg_32.png); }
    //[zoom>=14] { polygon-pattern-file: url(img/pattern/wetland_noveg_64.png); }
  }
  [class='breakwater'],
  [class='pier'] {
    polygon-fill: @land;
  }
}

// Hillshading //

/*#hillshade {
  ::0[zoom<=13],
  ::1[zoom=14],
  ::2[zoom>=15][zoom<=16],
  ::3[zoom>=17][zoom<=18],
  ::4[zoom>=19] {
    comp-op: hard-light;
    polygon-clip: false;
    image-filters-inflate: true;
    [class='full_shadow'] {
      polygon-fill:#111; // #103;
      polygon-opacity: 0.08;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.075; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.05; }
      [zoom>=18] { polygon-opacity: 0.025; }
    }
    [class='medium_shadow'] {
      polygon-fill:#222; // #206;
      polygon-opacity: 0.08;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.075; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.05; }
      [zoom>=18] { polygon-opacity: 0.025; }
    }
    [class='medium_highlight'] {
      polygon-fill: #ffb;
      polygon-opacity: 0.2;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.3; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.2; }
      [zoom>=18] { polygon-opacity: 0.1; }
    }
    [class='full_highlight'] {
      polygon-fill: #ffd;
      polygon-opacity: 0.25;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.3; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.2; }
      [zoom>=18] { polygon-opacity: 0.1; }
    }
  }
  ::1 { image-filters: agg-stack-blur(2,2); }
  ::2 { image-filters: agg-stack-blur(8,8); }
  ::3 { image-filters: agg-stack-blur(16,16); }
  ::4 { image-filters: agg-stack-blur(32,32); }
}*/

#hillshade[class='shadow'] {
  polygon-fill: black;
  [level=89] { polygon-opacity: 0.02; }
  [level=78] { polygon-opacity: 0.04; }
  [level=67] { polygon-opacity: 0.06; }
  [level=56] { polygon-opacity: 0.08; }
}

// Elevation contours & labels //

// Multiple copies of the same layer have been made, each with
// unique classes and positions in the stack. This is done by
// editing the layers list in <project.yml>.

#contour::line {
  line-color: #666;
  line-opacity: 0.2;
  [zoom=10]{ line-width: 0.4; }
  [zoom=11]{ line-width: 0.5; }
  [zoom=12]{ line-width: 0.8; }
  [zoom>=13]{ line-width: 0.8; }
  [index>=5] {
    line-opacity: 0.15;
    line-width: 1.1;
  }
}

#contour::label[ele!=0] {
  //[zoom<=12][index>=5],
  [zoom>=13][zoom<=15][index=10],
  [zoom>=16][index>=5] {
    text-name: "[ele]+' m'";
    text-face-name: 'Open Sans Regular';
    text-placement: line;
    text-size: 8;
    text-fill: #666;
    text-opacity: 0.2;
    text-avoid-edges: true;
    text-halo-fill: white;//fadeout(@crop,80%);
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
  }
}
