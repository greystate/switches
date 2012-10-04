// Generated by CoffeeScript 1.3.3
(function() {
  var Switch, SwitchBoardController, SwitchView, _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  this.app = (_ref = window.app) != null ? _ref : {};

  SwitchBoardController = (function() {

    function SwitchBoardController() {
      this.setupBoard();
    }

    SwitchBoardController.prototype.setupBoard = function() {
      return $('.switchboard').on('click', '.switch a', function() {
        var $sw;
        $sw = ($(this)).parent();
        $sw.toggleClass('off').toggleClass('on');
        return false;
      });
    };

    SwitchBoardController.prototype.buildASwitch = function() {
      var switch1, view1;
      switch1 = new Switch;
      view1 = new SwitchView({
        model: switch1,
        className: "switch " + (switch1.get('state'))
      });
      return ($('.switchboard')).append(view1.render().el);
    };

    return SwitchBoardController;

  })();

  $(function() {
    return app.controller = new SwitchBoardController;
  });

  /* --------------------------------------------
       Begin models.coffee
  --------------------------------------------
  */


  Switch = (function(_super) {

    __extends(Switch, _super);

    function Switch() {
      return Switch.__super__.constructor.apply(this, arguments);
    }

    Switch.prototype.defaults = {
      color: "rgba(255, 0, 0, 0.8)",
      state: 'on'
    };

    Switch.prototype.isOn = function() {
      return this.get('state') === 'on';
    };

    Switch.prototype.isOff = function() {
      return this.get('state') === 'off';
    };

    Switch.prototype.toggleState = function() {
      return this.set('state', this.isOn() ? 'off' : 'on');
    };

    return Switch;

  })(Backbone.Model);

  this.app.Switch = Switch;

  /* --------------------------------------------
       Begin views.coffee
  --------------------------------------------
  */


  SwitchView = (function(_super) {

    __extends(SwitchView, _super);

    function SwitchView() {
      return SwitchView.__super__.constructor.apply(this, arguments);
    }

    SwitchView.prototype.className = "switch";

    SwitchView.prototype.template = _.template('<a href="#">Switch <%= state %></a>');

    SwitchView.prototype.render = function() {
      this.$el.html(this.template(this.model.toJSON()));
      return this;
    };

    return SwitchView;

  })(Backbone.View);

  this.app.SwitchView = SwitchView;

}).call(this);
