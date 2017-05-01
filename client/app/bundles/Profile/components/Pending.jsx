// TODO for now at least, this will be for friendships that someone has initiated
// with a user and the user has to accept or decline.

import React from 'react';
import ReactDOM from 'react-dom';
import PendingFriend from './PendingFriend'

console.log('this is Pending motherfucker');

export default class Pending extends React.Component {
  constructor(props, _railsContext) {
    super(props);
    this.state = {
    };
  }

  // need to also create a chatroom when friendship is accepted
  acceptFriend = (friend) => {
    console.log('Starting to accept friends from pending!');
    return (event) => {
      event.preventDefault();
      $.ajax({
        data: {
          id: friend.friendship.id,
          friendship_status: "accepted"
        },
        url: "/friendships/" + friend.friendship.id,
        type: "PATCH",
        dataType: "json",
        success: console.log('Send ajax accept friend request!')
      })
    }
  }

  declineFriend = (friend) => {
    console.log('Starting to decline friends from pending!');
    return (event) => {
      event.preventDefault();
      $.ajax({
        data: {
          id: friend.friendship.id,
          friendship_status: "declined"
        },
        url: "/friendships/" + friend.friendship.id,
        type: "PATCH",
        dataType: "json",
        success: console.log('Send ajax to decline friend request!')
      })
    }
  }
  //
  // componentDidMount = () => {
  //
  // }

  render() {
    return (
      <div className='suggestion-list'>
        {this.props.pendingFriends.empty ? null : this.props.pendingFriends.map((friend) =>
          <PendingFriend friend={friend} acceptFriend={this.acceptFriend} declineFriend={this.declineFriend} key={friend.user_id}/>
        )}
      </div>
    );
  }
}
