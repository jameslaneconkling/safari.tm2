#water::water-fill {
  polygon-fill: @water;
  //polygon-gamma: 0.8;
  //polygon-pattern-file: url(img/pattern/wetland_noveg_32.png);
}

#water::water-shadow {
  polygon-fill: @water;
  // add texture
  opacity:1;
  comp-op: screen;
  image-filters: agg-stack-blur(60,60);
}

#water::water-line {
  line-color:@water-casing;
  line-width:0.6;
}



#waterway.casing::casing {
  line-color: @water-casing;
  line-cap: round;
  [class='river'] {
    [zoom>=8]{ line-width: 1; }
    [zoom>=10]{ line-width: 2; }
    [zoom>=12]{ line-width: 3; }
    [zoom>=14]{ line-width: 4; }
  }
  [class='stream'],
  [class='stream_intermittent'] {
    comp-op: multiply;
    [zoom>=13]{ line-width: 1.6; }
    [zoom>=14]{ line-width: 1.8; }
    [zoom>=15]{ line-width: 2; }
  }
  [class = 'drain'],
  [class = 'canal'] {
    [zoom>=8]{ line-width: 0; }
    [zoom>=10]{ line-width: 1; }
    [zoom>=12]{ line-width: 2; }
    [zoom>=14]{ line-width: 3; }
    line-opacity: 0.6;
  }
}

#waterway.fill::fill {
  line-color: @water;
  line-cap: round;
  [class='river'] {
    [zoom>=8]{ line-width: 0.6; }
    [zoom>=10]{ line-width: 1; }
    [zoom>=12]{ line-width: 2; }
    [zoom>=14]{ line-width: 3; }
  }
  [class='stream'],
  [class='stream_intermittent '] {
    [zoom>=13]{ line-width: 0.8; }
    [zoom>=14]{ line-width: 1.2; }
    [zoom>=15]{ line-width: 1.5; }
  }
  [class = 'drain'],
  [class = 'canal'] {
    [zoom>=8]{ line-width: 0.6; }
    [zoom>=10]{ line-width: 0.5; }
    [zoom>=12]{ line-width: 1; }
    [zoom>=14]{ line-width: 1.5; }
    //line-dasharray: 6,4;
    line-cap: square;
  }
}
