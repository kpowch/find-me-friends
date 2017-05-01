import React from 'react';
import ReactDOM from 'react-dom';

export default class PendingFriend extends React.Component {

  render() {
    // this makes the code more readable
    const { friend, acceptPendingFriend, declinePendingFriend } = this.props;

    return (
      <div className='friend'>
        <a className='remove-filter' onClick={acceptPendingFriend(friend)}>ACCEPT</a><br/>
        <a className='remove-filter' onClick={declinePendingFriend(friend)}>REMOVE</a><br/>
        <div className='card-name'>
          {friend.first_name}
        </div>
        <div className='card-name'>
          {friend.last_name}
        </div>
        <img className='card-pic' src={friend.profile_picture}/>
        <div className='card-email'>
          {friend.email}
        </div>
      </div>
    );
  }
}
