// Generated by CoffeeScript 1.3.3
(function() {
  var Switch, SwitchBoard, SwitchBoardController, SwitchBoardView, SwitchView, _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.app = (_ref = window.app) != null ? _ref : {};

  SwitchBoardController = (function() {

    function SwitchBoardController() {
      this.setupBoard();
    }

    SwitchBoardController.prototype.setupBoard = function() {
      var board, boardView;
      board = app.board = new SwitchBoard;
      board.add();
      boardView = app.boardView = new SwitchBoardView({
        collection: board
      });
      return $('body').append(boardView.render().el);
    };

    SwitchBoardController.prototype.buildASwitch = function() {
      return app.board.add();
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

    Switch.COLORS = ["red", "green", "orange"];

    Switch.prototype.defaults = {
      color: Switch.COLORS[0],
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

    Switch.prototype.cycleColor = function() {
      var colors, currentColor, index, newColor, _i, _ref1;
      colors = Switch.COLORS;
      currentColor = this.get('color');
      for (index = _i = 0, _ref1 = colors.length; 0 <= _ref1 ? _i < _ref1 : _i > _ref1; index = 0 <= _ref1 ? ++_i : --_i) {
        if (colors[index] === currentColor) {
          newColor = colors[index === colors.length - 1 ? 0 : index + 1];
        }
      }
      return this.set('color', newColor);
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
      this.colorChanged = __bind(this.colorChanged, this);

      this.stateChanged = __bind(this.stateChanged, this);
      return SwitchView.__super__.constructor.apply(this, arguments);
    }

    SwitchView.prototype.initialize = function() {
      this.model.on('change:state', this.stateChanged);
      return this.model.on('change:color', this.colorChanged);
    };

    SwitchView.prototype.className = "switch";

    SwitchView.prototype.events = {
      'click a': function(event) {
        event.preventDefault();
        return this.model.toggleState();
      },
      'keypress a': function(event) {
        switch (event.keyCode) {
          case 99:
            if (event.keyCode === 99) {
              return this.model.cycleColor();
            }
            break;
          case 32:
            return this.model.toggleState();
        }
      }
    };

    SwitchView.prototype.template = _.template('<a href="#">Switch <%= state %></a>');

    SwitchView.prototype.render = function() {
      this.$el.html(this.template(this.model.toJSON()));
      this.$el.addClass(this.model.get('state'));
      this.$el.addClass(this.model.get('color'));
      return this;
    };

    SwitchView.prototype.stateChanged = function(theSwitch, state) {
      return this.$el.removeClass(theSwitch.previous('state')).addClass(state);
    };

    SwitchView.prototype.colorChanged = function(theSwitch, color) {
      return this.$el.removeClass(theSwitch.previous('color')).addClass(color);
    };

    return SwitchView;

  })(Backbone.View);

  SwitchBoardView = (function(_super) {

    __extends(SwitchBoardView, _super);

    function SwitchBoardView() {
      return SwitchBoardView.__super__.constructor.apply(this, arguments);
    }

    SwitchBoardView.prototype.initialize = function() {
      return this.collection.on('add', this.render, this);
    };

    SwitchBoardView.prototype.className = "switchboard";

    SwitchBoardView.prototype.render = function() {
      var _this = this;
      this.$el.html('');
      this.collection.each(function(swatch) {
        return _this.$el.append(new SwitchView({
          model: swatch
        }).render().el);
      });
      return this;
    };

    return SwitchBoardView;

  })(Backbone.View);

  this.app.SwitchView = SwitchView;

  this.app.SwitchBoardView = SwitchBoardView;

  /* --------------------------------------------
       Begin collections.coffee
  --------------------------------------------
  */


  SwitchBoard = (function(_super) {

    __extends(SwitchBoard, _super);

    function SwitchBoard() {
      return SwitchBoard.__super__.constructor.apply(this, arguments);
    }

    SwitchBoard.prototype.model = Switch;

    return SwitchBoard;

  })(Backbone.Collection);

  this.app.SwitchBoard = SwitchBoard;

}).call(this);
