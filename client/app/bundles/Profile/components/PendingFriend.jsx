import React from 'react';
import ReactDOM from 'react-dom';

export default class PendingFriend extends React.Component {

  render() {
    const friend = this.props.friend;
    return (
      <div className="friend">
        <a className="remove-filter" onClick={this.props.acceptFriend(friend)}>ACCEPT</a><br/>
        <a className="remove-filter" onClick={this.props.declineFriend(friend)}>REMOVE</a><br/>
        <div className="card-name">
          {friend.first_name}
        </div>
        <div className="card-name">
          {friend.last_name}
        </div>
        <img className="card-pic" src={friend.profile_picture}/>
        <div className="card-email">
          {friend.email}
        </div>
      </div>
    );
  }
}
