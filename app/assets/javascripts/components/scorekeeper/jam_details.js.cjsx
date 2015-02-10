cx = React.addons.classSet
exports = exports ? this
exports.JamDetails = React.createClass
  displayName: 'JamDetails'
  propType:
    jamState: React.PropTypes.object.isRequired
    mainMenuHandler: React.PropTypes.func
    prevJamHandler: React.PropTypes.func
    nextJamHandler: React.PropTypes.func

  totalPoints: () ->
    points = 0
    this.props.jamState.passStates.map (pass) =>
      points += pass.points
    return points

  render: () ->
    <div className="jam-details">
      <div className="links">
        <div className="row text-center gutters-xs">
          <div className="col-sm-6 col-xs-6">
            <button className="main-menu link btn btn-block" onClick={this.props.mainMenuHandler}>
              Main Menu
            </button>
          </div>
          <div className="col-sm-6 col-xs-6">
            <div className="row gutters-xs">
              <div className="col-sm-5 col-xs-5 col-sm-offset-1 col-xs-offset-1">
                <button className="prev link btn btn-block" onClick={this.props.prevJamHandler}>
                  Prev
                </button>
              </div>
              <div className="col-sm-6 col-xs-6">
                <button className="next link btn btn-block" onClick={this.props.nextJamHandler}>
                  Next
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className="jam-details">
        <div className="row gutters-xs">
          <div className="col-sm-3 col-xs-3 col-sm-offset-6 col-xs-offset-6">
            <div className="jam-number">
              <strong>Jam {this.props.jamState.jamNumber}</strong>
            </div>
          </div>
          <div className="col-sm-3 col-xs-3 text-right">
            <div className="jam-total-score">
              <strong>{this.totalPoints()}</strong>
            </div>
          </div>
        </div>
      </div>
      <div className="passes">
        <div className="headers">
          <div className="row gutters-xs">
            <div className="col-sm-2 col-xs-2">
              Pass
            </div>
            <div className="col-sm-2 col-xs-2">
              Skater
            </div>
            <div className="col-sm-2 col-xs-2"></div>
            <div className="col-sm-2 col-xs-2 text-center">
              Notes
            </div>
            <div className="col-sm-2 col-xs-2"></div>
            <div className="col-sm-2 col-xs-2 text-center">
              Points
            </div>
          </div>
        </div>
      </div>
    </div>
