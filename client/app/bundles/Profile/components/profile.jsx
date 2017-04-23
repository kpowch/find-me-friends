

import PropTypes from 'prop-types';
import React from 'react';

import Sidebar from './Sidebar.jsx';
import SuggestionList from './SuggestionList.jsx'
import Friend from './Friend.jsx'

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
      currentUser: this.props.user,
      friendsList: []
     };
  }

  /* Need method to add friend panels */
  addFriend(friend) {
    for (let i = int; i>0; i++){
      nextFriend = new_friendships_path
      console.log(nextFriend)
      this.state.friendsList.push(nextFriend)
    }
  }

  render () {
    return (
      <div className="profiles">
        <div>
          <SuggestionList friendsList={this.state.friendsList} addFriend={this.addFriend}>
        </div>
        <div className="sidebar">
          <Sidebar user={this.state.currentUser}>
        </div>
      </div>
    )
  }
}
