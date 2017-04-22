

import PropTypes from 'prop-types';
import React from 'react';

export default class Profile extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   * @param _railsContext - Comes from React on Rails
   */

  constructor(props, _railsContext) {
    super(props);

    this.state = {
      currentUser: userStats(this.props.user),
      friendsList: []
     };
  }

  /* Need method to add friend panels */
  addFriend(int) {
    for (let i = int; i>0; i++){
      nextFriend =
      this.state.friendsList.push()
    }
  }

  userStats(user) {

  }

  render() {
    return (
      <div className="profiles">
        <div>
          <SuggestionList friendsList={this.state.friendsList} addFriend={this.state.addFriend}>
        </div>
        <div className="sidebar">
          <Sidebar >
        </div>
      </div>
      )
  }
}
