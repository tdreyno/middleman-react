/** @jsx React.DOM */

var React = require('react');

var App = React.createClass({
  render: function() {
    return <div>Hola Mundo</div>;
  }
});

React.renderComponent(App, document.getElementById('app2'));
