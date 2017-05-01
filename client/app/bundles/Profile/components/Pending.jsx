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
    return (event) => {
      event.preventDefault();
      console.log(friend.friendship);
      $.ajax({
        data: {
          friendship: {
            id: friend.friendship_id,
            user_id: current_user.id,
            friendship_status: "accepted"
          }
        },
        url: "/friendships/" + friend.friendship_id,
        type: "PATCH",
        dataType: "json",
        success: console.log('Accepted friend request!')
      })
  }

  // removeFriend = (event) => {
  //
  // }
  //
  // componentDidMount = () => {
  //
  // }

  render() {
    return (
      <div className='suggestion-list'>
        {this.props.pendingFriends.empty ? null : this.props.pendingFriends.map((friend) =>
          <PendingFriend friend={friend} acceptFriend={this.acceptFriend} key={friend.id}/>
        )}
      </div>
    );
  }
}
