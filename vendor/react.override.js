var RenderInBody = React.createClass({

  componentDidMount: function() {
    this.popup = document.createElement("div");
    document.body.appendChild(this.popup);
    this._renderLayer();
    React.findDOMNode(this).innerHTML = "";
  },


  componentDidUpdate: function() {
    this._renderLayer();
  },


  componentWillUnmount: function() {
    React.unmountComponentAtNode(this.popup);
    document.body.removeChild(this.popup);
  },


  _renderLayer: function() {
    React.render(this.props.children, this.popup);
  },


  render: function() {
    // Render a placeholder
    return React.DOM.div(this.props);
  }

});