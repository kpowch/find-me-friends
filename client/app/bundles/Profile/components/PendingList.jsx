import React from 'react';
import ReactDOM from 'react-dom';
import PendingFriend from './PendingFriend'

console.log('this is Pending motherfucker');

export default class PendingList extends React.Component {

  // TODO need to also create a chatroom when friendship is accepted user promise.all
  // if pending friend added, change friendship status to 'accepted' then refresh list
  acceptPendingFriend = (friend) => {
    console.log('entered PendingList acceptPendingFriend');
    return (ev) => {
      ev.preventDefault();
      // send ajax to update friendship status
      $.ajax({
        data: {
          id: friend.friendship.id,
          friendship_status: 'accepted'
        },
        url: '/friendships/' + friend.friendship.id,
        type: 'PATCH',
        dataType: 'json',
        success: () => this.props.refreshPendingList(friend)
      });
    };
  }

  // if pending friend declined, change friendship status to 'declined' then refresh list
  declinePendingFriend = (friend) => {
    console.log('entered PendingList declinePendingFriend');
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
        success: () => this.props.refreshPendingList(friend)
      });
    };
  }

  render() {
    return (
      <div>
        <h1> Pending Friends </h1>
        <div className='suggestion-list'>
          {this.props.pendingFriends.empty ? null : this.props.pendingFriends.map((friend) =>
            <PendingFriend
              friend={friend}
              acceptPendingFriend={this.acceptPendingFriend}
              declinePendingFriend={this.declinePendingFriend}
              key={friend.user_id}
            />
          )}
        </div>
      </div>
    );
  }
}
