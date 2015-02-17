cx = React.addons.classSet
exports = exports ? this
exports.PenaltyTracker = React.createClass
  displayName: 'PenaltyTracker'

  mixins: [GameStateMixin]
  
  getInitialState: () ->
    componentId: exports.wftda.functions.uniqueId()

  render: () ->
    awayElement = <TeamPenalties teamState=this.state.gameState.awayAttributes />
    homeElement = <TeamPenalties teamState=this.state.gameState.homeAttributes />
    <div className="penalty-tracker">
      <TeamSelector
        awayAttributes={this.state.gameState.awayAttributes}
        awayElement={awayElement}
        homeAttributes={this.state.gameState.homeAttributes}
        homeElement={homeElement} />
   	</div>
