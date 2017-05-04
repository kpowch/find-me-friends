import PropTypes from 'prop-types';
import React from 'react';
import Sidebar from './Sidebar'
import SuggestionList from './SuggestionList'
import PendingList from './PendingList'

export default class Profile extends React.Component {
  static propTypes = {};

  // NOTE: props comes from your rails view; _railsContext comes from React on Rails
  constructor(props, _railsContext) {
    super(props);
    console.log('props in profile', props)
    this.state = {
      suggestedFriends: this.props.suggested_friends,
      pendingFriends: this.props.pending_friends,
      notifications: this.props.notifications
  };
}

  /*
  * NOTE: these refresh functions would all be better using Redux to ensure
  * we're getting correct lists instead of just doing optimistic updates
  * (showing a change without checking if change saved in server)
  */

  // refreshes SuggestionList with updated friends when suggested friend declined
  refreshSuggestedList = (friend) => {
    // remove friend from list
    var friends = this.state.suggestedFriends.filter(function(fnd){
      return friend.user_id !== fnd.user_id;
    });
    // refresh suggestedFriends state
    this.setState({
      suggestedFriends: friends
    });
  }

  // refreshes PendingList with updated friends when pending friend declined/accepted
  refreshPendingList = (friend) => {
    // remove friend from list
    var friends = this.state.pendingFriends.filter(function(fnd){
      return friend.user_id !== fnd.user_id;
    });
    // refresh pendingFriends state
    this.setState({
      pendingFriends: friends
    });
  }

  // refreshes both lists with updated friends when suggested friend added (now 'pending')
  refreshBothLists = (friend) => {
    // remove friend from suggestedFriends list
    var friends = this.state.suggestedFriends.filter(function(fnd){
      return friend.user_id !== fnd.user_id;
    });
    // add friend to pendingFriends list
    var pending = this.state.pendingFriends.concat([friend]);
    // refresh both lists with updated friends
    this.setState({
      suggestedFriends: friends,
      pendingFriends: pending
    });
  }

  render() {
    return (
      <div className='scrollable-wrapper'>
        <div className='left-scrollable-wrapper'>
          <div className='scrollable'>
            <Sidebar
              currentUser={this.props.current_user}
              current_interests={this.props.current_interests}
              notifications={this.props.notifications}
              refreshNotificationList={this.refreshNotificationList}
            />
          </div>
        </div>
        <div className='right-scrollable-wrapper-wrapper'>
          <div className='right-scrollable-wrapper'>
            <div className='scrollable'>
            <PendingList
              currentUser={this.props.current_user}
              pendingFriends={this.state.pendingFriends}
              refreshPendingList={this.refreshPendingList}
            />
            <SuggestionList
              currentUser={this.props.current_user}
              suggestedFriends={this.state.suggestedFriends}
              refreshSuggestedList={this.refreshSuggestedList}
              refreshBothLists={this.refreshBothLists}
            />
          </div>
          </div>
        </div>
      </div>
    );
  }
}
