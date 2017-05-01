import React from 'react';
import ReactDOM from 'react-dom';
import Friend from './Friend'

console.log('am I in SuggestionList or some alternate reality')

export default class SuggestionList extends React.Component {

  // if suggested friend added, change friendship status to 'pending' then refresh lists
  addSuggestedFriend = (friend) => {
    console.log('entered SuggestionList addSuggestedFriend')
    return (ev) => {
      ev.preventDefault();
      // send ajax to update friendship where 'initiator' is user_id
      $.ajax({
        data: {
          id: friend.friendship.id,
          user_id: this.props.currentUser.id,
          // if friend_id is the current user, switch it to the friendship user_id
          friend_id: (friend.friendship.friend_id = this.props.currentUser.id) ? friend.friendship.user_id : friend.friendship.friend_id,
          friendship_status: 'pending'
        },
        url: '/friendships/' + friend.friendship.id,
        type: 'PATCH',
        dataType: 'json',
        success: () => this.props.refreshBothLists(friend)
      });
    };
  }

  // if suggested friend declined, change friendship status to 'declined' then refresh list
  declineSuggestedFriend = (friend) => {
    console.log('entered SuggestionList declineSuggestedFriend')
    return (ev) => {
      ev.preventDefault();
      // send ajax to update friendship status
      $.ajax({
        data: {
          id: friend.friendship.id,
          friendship_status: 'declined'
        },
        url: '/friendships/' + friend.friendship.id,
        type: 'PATCH',
        dataType: 'json',
        success: () => this.props.refreshSuggestedList(friend)
      });
    };
  }

  render() {
    return (
      <div>
        <h1> Suggested Friends </h1>
        <div className='suggestion-list'>
          {this.props.suggestedFriends.empty ? null : this.props.suggestedFriends.map((friend) =>
            <Friend
              friend={friend}
              addSuggestedFriend={this.addSuggestedFriend}
              declineSuggestedFriend={this.declineSuggestedFriend}
              key={friend.user_id}
            />
          )}
        </div>
      </div>
    );
  }
}
