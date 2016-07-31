#hillshade[class='shadow'] {
  polygon-fill: black;
  [level=89] { polygon-opacity: 0.02; }
  [level=78] { polygon-opacity: 0.06; }
  [level=67] { polygon-opacity: 0.1; }
  [level=56] { polygon-opacity: 0.2; }
}

#contour {
  line-color: #666;
  line-opacity: 0.2;
  [zoom=9]{ line-width: 0.4; }
  [zoom=10]{ line-width: 0.4; }
  [zoom=11]{ line-width: 0.5; }
  [zoom=12]{ line-width: 0.5; }
  [zoom>=13]{ line-width: 0.5; }
  [index>=5] {
    line-opacity: 0.15;
    line-width: 1;
  }
}

#contour.label::label[ele!=0] {
  [zoom<=12][index>=5],
  [zoom>=13][zoom<=15][index=10],
  [zoom>=16][index>=5] {
    text-name: "[ele]+' m'";
    text-face-name: 'Open Sans Regular';
    text-repeat-distance: 100;
    text-placement: line;
    text-size: 8;
    text-fill: #666;
    text-opacity: 0.8;
    text-avoid-edges: true;
    text-halo-fill: white;
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
  }
}
