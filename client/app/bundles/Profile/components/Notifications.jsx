import React from 'react';
import ReactDOM from 'react-dom';

export default class Sidebar extends React.Component {

  render() {
    // this makes the code more readable
    const { notifications, deleteNotification } = this.props

    return (
      <div>
        {notifications.map((n) =>
          <a key={n.id} onClick={deleteNotification(n)}>
            <div className='notification'>
              <p className="fa fa-bell" aria-hidden="true"></p>
              <p >{n.content}</p>
            </div>
          </a>
        )}
      </div>
    )
  }
}
