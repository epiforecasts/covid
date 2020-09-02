HTMLWidgets.widget({

  name: 'RtD3',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.

        var vis = new rtVis(x);

        vis.setupPage(el)
        vis.createMap()
        vis.plotRt('R0')

        //console.log(el)

        //d3.select(el).append('div').text(x.data[0]['a'])
        //el.innerText = x.message;

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
