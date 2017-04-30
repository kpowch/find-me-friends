import React from 'react';
import ReactDOM from 'react-dom';

class Friend extends React.Component {

  render() {
    const friend = this.props.friend;
    return (
      <div className="friend">
        <a className="remove-filter" onClick={this.props.onACCEPT}>ACCEPT</a><br/>
        <a className="remove-filter" onClick={this.props.onRemove}>REMOVE</a><br/>
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

export default Friend;