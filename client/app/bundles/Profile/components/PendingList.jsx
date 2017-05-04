import React from 'react';
import ReactDOM from 'react-dom';
import PendingFriend from './PendingFriend'

export default class PendingList extends React.Component {

  // if pending friend added, change friendship status to 'accepted' then refresh list
  acceptPendingFriend = (friend) => {
    return (ev) => {
      ev.preventDefault();
      // sends ajax to update friendship status and create chatroom
      const makeAjaxCall = (data, url, methodType, callback) => {
        return new Promise((resolve, reject) => {
          $.ajax({
            data: data,
            url: url,
            method: methodType,
            dataType: 'json',
            success: () => {
              this.props.refreshPendingList(friend);
              resolve();
            },
            error: (err) => {
              console.log('Unsuccessfully accepted pending friend and chatroom :(')
              reject(err);
            }
          })
        })
      }

      return Promise.all([
        makeAjaxCall(
          { id: friend.friendship.id, friendship_status: 'accepted' },
          '/friendships/' + friend.friendship.id,
          'PATCH'
        ),
        makeAjaxCall(
          { chatroom: { friendship_id: friend.friendship.id } },
          '/chatrooms/',
          'POST'
        )
      ])
      .then(() => {
        console.log('Successfully accepted pending friend and created chatroom!');
      })
    }
  }

  // if pending friend declined, change friendship status to 'declined' then refresh list
  declinePendingFriend = (friend) => {
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
    if (this.props.pendingFriends.length === 0) {
      return null
    } else {
      return (
        <div>
          <h1 className='profile-heading'> Pending Friends </h1>
          <div className='suggestion-list'>
            {this.props.pendingFriends.map((friend) =>
              <PendingFriend
                friend={friend}
                acceptPendingFriend={this.acceptPendingFriend}
                declinePendingFriend={this.declinePendingFriend}
                currentUser={this.props.currentUser}
                key={friend.user_id}
              />
            )}
          </div>
        </div>
      );
    }
  }
}
